import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:fluento/models/article.dart';
import 'package:fluento/services/article_sources/article_source.dart';
import 'package:fluento/services/article_sources/voa_source.dart';
import 'package:fluento/services/article_sources/wikipedia_source.dart';
import 'package:fluento/services/article_sources/nasa_source.dart';
import 'package:fluento/services/article_sources/global_voices_source.dart';
import 'package:fluento/services/article_pipeline/article_pipeline.dart';

void main() async {
  stdout.writeln('=== Starting Fluento Article Fetch & Curation Pipeline ===');

  final client = http.Client();
  final sources = <ArticleSource>[
    VoaLearningEnglishSource(client: client),
    WikipediaSource(client: client),
    NasaSource(client: client),
    GlobalVoicesSource(client: client),
  ];

  // 1. Fetch raw articles from all redistributable sources
  final rawArticles = <RawArticle>[];
  for (final source in sources) {
    if (!source.redistributable) continue;
    stdout.writeln('Fetching from ${source.name}...');
    try {
      final items = await source.fetch();
      stdout.writeln('  -> Found ${items.length} candidates from ${source.name}');
      rawArticles.addAll(items);
    } catch (e) {
      stdout.writeln('  -> Warning: Failed to fetch from ${source.name}: $e');
    }
  }

  // 2. Process articles through pipeline
  final pipeline = ArticlePipeline(minWordCount: 150, maxWordCount: 1500);
  final processedArticles = pipeline.process(rawArticles);
  stdout.writeln('Pipeline successfully processed ${processedArticles.length} clean articles.');

  // 3. Load existing articles.json if present to preserve previous translations
  final outputFile = File('articles.json');
  final existingMap = <String, Article>{};
  if (outputFile.existsSync()) {
    try {
      final content = outputFile.readAsStringSync();
      final decoded = jsonDecode(content);
      final List list = decoded is List ? decoded : (decoded['articles'] as List? ?? []);
      for (final item in list) {
        final article = Article.fromJson(item as Map<String, dynamic>);
        existingMap[article.id] = article;
      }
      stdout.writeln('Loaded ${existingMap.length} existing articles from cache.');
    } catch (_) {}
  }

  // 4. Merge newly fetched with existing articles
  final finalArticles = <Article>[];
  final llmApiKey = Platform.environment['LLM_API_KEY'];
  final llmModel = Platform.environment['LLM_MODEL'] ?? 'gemini-1.5-flash';

  for (final article in processedArticles) {
    Article toAdd = article;

    // If already exists and has translation, preserve it
    if (existingMap.containsKey(article.id) &&
        existingMap[article.id]!.translationsAr != null &&
        existingMap[article.id]!.translationsAr!.isNotEmpty) {
      toAdd = existingMap[article.id]!;
    } else if (llmApiKey != null && llmApiKey.trim().isNotEmpty) {
      // Optional Gemini LLM Translation & Writing prompt generation
      // Skip sources that disallow adaptations
      if (article.license.contains('ND') || article.sourceName.contains('Conversation')) {
        stdout.writeln('Skipping translation for ${article.title} (No-Derivatives license).');
      } else {
        stdout.writeln('Requesting Egyptian Arabic translation via Gemini for: "${article.title}"...');
        final translated = await _generateTranslationsAndPromptWithGemini(
          article: article,
          apiKey: llmApiKey,
          model: llmModel,
          client: client,
        );
        if (translated != null) {
          toAdd = translated;
        }
        // Small delay to respect API rate limits
        await Future.delayed(const Duration(milliseconds: 800));
      }
    }

    finalArticles.add(toAdd);
  }

  // Keep up to 100 high-quality articles
  final trimmedArticles = finalArticles.take(100).toList();

  // 5. Output to articles.json
  final outputJson = jsonEncode(trimmedArticles.map((a) => a.toJson()).toList());
  outputFile.writeAsStringSync(outputJson);
  stdout.writeln('Wrote ${trimmedArticles.length} articles to articles.json successfully.');

  // Also write to web build directory for GitHub Pages if exists
  final pagesDir = Directory('build/pages');
  if (!pagesDir.existsSync()) {
    pagesDir.createSync(recursive: true);
  }
  File('build/pages/articles.json').writeAsStringSync(outputJson);
  stdout.writeln('Copied articles.json to build/pages/articles.json for GitHub Pages.');

  client.close();
  stdout.writeln('=== Pipeline execution complete ===');
}

Future<Article?> _generateTranslationsAndPromptWithGemini({
  required Article article,
  required String apiKey,
  required String model,
  required http.Client client,
}) async {
  final sentences = article.sentenceList;
  if (sentences.isEmpty) return null;

  final promptText = '''
You are an expert bilingual linguist specializing in Egyptian Arabic (عامية مصرية) and English language education.
Context: An English learning article titled "${article.title}".
Sentences to translate:
${jsonEncode(sentences)}

Task:
1. Translate each English sentence into natural, expressive Egyptian Arabic (عامية مصرية), faithful to the original meaning. Do NOT use Modern Standard Arabic (فصحى).
2. The translation array MUST have exactly ${sentences.length} items, aligned index-for-index with the English sentences.
3. Write one engaging writing challenge prompt for the learner (suitable for CEFR ${article.level.name.toUpperCase()} level).

Return ONLY valid JSON matching this schema:
{
  "translations_ar": ["ترجمة الجملة الأولى", "ترجمة الجملة التانية", ...],
  "writing_prompt": "Prompt text in English"
}
''';

  final url = 'https://generativelanguage.googleapis.com/v1beta/models/$model:generateContent?key=$apiKey';

  for (int attempt = 0; attempt < 2; attempt++) {
    try {
      final response = await client.post(
        Uri.parse(url),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'contents': [
            {
              'parts': [
                {'text': promptText}
              ]
            }
          ],
          'generationConfig': {
            'temperature': 0.3,
            'responseMimeType': 'application/json',
          }
        }),
      ).timeout(const Duration(seconds: 30));

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final rawText = data['candidates']?[0]?['content']?['parts']?[0]?['text']?.toString() ?? '';
        final parsed = jsonDecode(rawText);

        final translations = (parsed['translations_ar'] as List?)?.map((e) => e.toString()).toList();
        final writingPrompt = parsed['writing_prompt']?.toString();

        if (translations != null && translations.length == sentences.length) {
          return Article(
            id: article.id,
            title: article.title,
            description: article.description,
            content: article.content,
            topic: article.topic,
            imageEmoji: article.imageEmoji,
            level: article.level,
            readingTimeMinutes: article.readingTimeMinutes,
            newWordsCount: article.newWordsCount,
            sourceName: article.sourceName,
            sourceUrl: article.sourceUrl,
            license: article.license,
            author: article.author,
            publishedAt: article.publishedAt,
            sentences: sentences,
            translationsAr: translations,
            writingPrompt: writingPrompt ?? article.writingPrompt,
            isNew: true,
          );
        }
      }
    } catch (_) {
      // Retry once on network or parsing error
    }
  }

  return null;
}
