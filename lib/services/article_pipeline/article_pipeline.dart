import 'package:fluento/models/article.dart';
import 'package:fluento/services/article_sources/article_source.dart';
import 'package:fluento/services/article_pipeline/text_cleaner.dart';
import 'package:fluento/services/article_pipeline/sentence_splitter.dart';
import 'package:fluento/services/article_pipeline/cefr_estimator.dart';

class ArticlePipeline {
  final CefrEstimator _cefrEstimator;
  final int minWordCount;
  final int maxWordCount;

  ArticlePipeline({
    CefrEstimator? cefrEstimator,
    this.minWordCount = 200,
    this.maxWordCount = 1500,
  }) : _cefrEstimator = cefrEstimator ?? CefrEstimator();

  /// Processes raw articles through cleaning, deduplication, length filtering,
  /// sentence splitting, CEFR estimation, and categorization.
  List<Article> process(List<RawArticle> rawArticles) {
    final processed = <Article>[];
    final seenHashes = <String>{};

    for (final raw in rawArticles) {
      // 1. Clean HTML & extract main text
      final cleanedBody = TextCleaner.cleanHtml(raw.rawContent);
      final cleanedTitle = TextCleaner.cleanHtml(raw.rawTitle);

      if (cleanedTitle.trim().isEmpty || cleanedBody.trim().isEmpty) {
        continue;
      }

      // 2. Dedupe by URL and title hash
      final hash = TextCleaner.computeDedupeHash(raw.sourceUrl, cleanedTitle);
      if (seenHashes.contains(hash)) {
        continue;
      }
      seenHashes.add(hash);

      // 3. Filter by length (words count)
      final wordCount = TextCleaner.countWords(cleanedBody);
      if (wordCount < minWordCount || wordCount > maxWordCount) {
        continue;
      }

      // 4. Sentence split
      final sentences = SentenceSplitter.split(cleanedBody);
      if (sentences.isEmpty) {
        continue;
      }

      // 5. Estimate CEFR Level
      final estimatedLevel = _cefrEstimator.estimate(
        cleanedBody,
        sourceHint: raw.levelHint,
      );

      // 6. Categorize topic
      final category = CefrEstimator.categorize(
        cleanedBody,
        categoryHint: raw.categoryHint,
      );

      // 7. Reading time (average 130 words/min)
      final readingMinutes = (wordCount / 130).ceil().clamp(1, 15);

      // 8. Estimate new words count for the learner
      final newWordsCount = (wordCount * 0.025).round().clamp(4, 20);

      // 9. Pick emoji
      final emoji = _getCategoryEmoji(category);

      // 10. Generate description
      final description = raw.rawDescription?.isNotEmpty == true
          ? TextCleaner.cleanHtml(raw.rawDescription!)
          : (sentences.isNotEmpty ? sentences.first : cleanedTitle);

      processed.add(Article(
        id: hash.substring(0, 16),
        title: cleanedTitle,
        description: description.length > 130 ? '${description.substring(0, 130)}...' : description,
        content: cleanedBody,
        topic: category,
        imageEmoji: emoji,
        level: estimatedLevel,
        readingTimeMinutes: readingMinutes,
        newWordsCount: newWordsCount,
        sourceName: raw.sourceName,
        sourceUrl: raw.sourceUrl,
        license: raw.license,
        author: raw.author,
        publishedAt: raw.publishedAt ?? DateTime.now(),
        sentences: sentences,
        isNew: true,
      ));
    }

    return processed;
  }

  static String _getCategoryEmoji(String category) {
    switch (category) {
      case 'Technology':
        return '🤖';
      case 'Science':
        return '🔬';
      case 'Business':
        return '📈';
      case 'Health':
        return '🩺';
      case 'Travel':
        return '✈️';
      case 'Environment':
        return '🌱';
      case 'Culture':
        return '🎨';
      case 'Society':
        return '👥';
      case 'Daily Life':
      default:
        return '☕';
    }
  }
}
