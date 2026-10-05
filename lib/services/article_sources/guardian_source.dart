import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:fluento/models/cefr_level.dart';
import 'package:fluento/services/article_sources/article_source.dart';
import 'package:fluento/services/article_pipeline/text_cleaner.dart';

class GuardianSource implements ArticleSource {
  final http.Client _client;
  final String? _apiKey;

  GuardianSource({http.Client? client, String? apiKey})
      : _client = client ?? http.Client(),
        _apiKey = apiKey ?? const String.fromEnvironment('GUARDIAN_API_KEY', defaultValue: '');

  @override
  String get id => 'guardian';

  @override
  String get name => 'The Guardian';

  // API terms do NOT allow republishing full text: must NEVER be written to public articles.json
  @override
  bool get redistributable => false;

  @override
  Future<List<RawArticle>> fetch() async {
    // If no API key provided, skip gracefully
    if (_apiKey == null || _apiKey.trim().isEmpty) {
      return [];
    }

    final results = <RawArticle>[];
    try {
      final url = 'https://content.guardianapis.com/search?api-key=$_apiKey&show-fields=bodyText,trailText,byline&page-size=10';
      final response = await _client.get(
        Uri.parse(url),
        headers: {'User-Agent': 'Fluento/1.0 (English Learning App)'},
      ).timeout(const Duration(seconds: 10));

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final resultsList = data['response']?['results'] as List? ?? [];

        for (final item in resultsList) {
          final title = item['webTitle']?.toString() ?? '';
          final webUrl = item['webUrl']?.toString() ?? '';
          final fields = item['fields'] as Map<String, dynamic>?;
          final bodyText = fields?['bodyText']?.toString() ?? '';
          final trailText = fields?['trailText']?.toString() ?? '';
          final byline = fields?['byline']?.toString() ?? 'The Guardian';
          final pubDateStr = item['webPublicationDate']?.toString();

          DateTime? pubDate;
          if (pubDateStr != null) {
            try {
              pubDate = DateTime.tryParse(pubDateStr);
            } catch (_) {}
          }

          final cleaned = TextCleaner.cleanHtml(bodyText);
          if (title.isNotEmpty && cleaned.isNotEmpty) {
            results.add(RawArticle(
              sourceId: id,
              sourceName: name,
              sourceUrl: webUrl,
              license: 'Guardian Open Platform Terms (Non-redistributable, on-device only)',
              author: byline,
              publishedAt: pubDate ?? DateTime.now(),
              rawTitle: title,
              rawContent: cleaned,
              rawDescription: trailText.isNotEmpty ? trailText : null,
              categoryHint: item['sectionName']?.toString(),
              levelHint: CefrLevel.c1,
            ));
          }
        }
      }
    } catch (_) {}
    return results;
  }
}
