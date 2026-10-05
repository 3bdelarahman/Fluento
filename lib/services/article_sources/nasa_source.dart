import 'package:http/http.dart' as http;
import 'package:xml/xml.dart';
import 'package:fluento/models/cefr_level.dart';
import 'package:fluento/services/article_sources/article_source.dart';
import 'package:fluento/services/article_pipeline/text_cleaner.dart';

class NasaSource implements ArticleSource {
  final http.Client _client;

  NasaSource({http.Client? client}) : _client = client ?? http.Client();

  @override
  String get id => 'nasa';

  @override
  String get name => 'NASA News & Features';

  @override
  bool get redistributable => true; // US Public Domain

  static const String _rssUrl = 'https://www.nasa.gov/news-release/feed/';

  @override
  Future<List<RawArticle>> fetch() async {
    final results = <RawArticle>[];
    try {
      final response = await _client.get(
        Uri.parse(_rssUrl),
        headers: {'User-Agent': 'Fluento/1.0 (English Learning App)'},
      ).timeout(const Duration(seconds: 10));

      if (response.statusCode == 200) {
        final document = XmlDocument.parse(response.body);
        final items = document.findAllElements('item');

        for (final item in items) {
          final title = item.findElements('title').firstOrNull?.innerText ?? '';
          final link = item.findElements('link').firstOrNull?.innerText ?? '';
          final description = item.findElements('description').firstOrNull?.innerText ?? '';
          final pubDateStr = item.findElements('pubDate').firstOrNull?.innerText;

          DateTime? pubDate;
          if (pubDateStr != null) {
            try {
              pubDate = DateTime.tryParse(pubDateStr);
            } catch (_) {}
          }

          final cleanedContent = TextCleaner.cleanHtml(description);
          if (title.isNotEmpty && cleanedContent.isNotEmpty) {
            results.add(RawArticle(
              sourceId: id,
              sourceName: name,
              sourceUrl: link,
              license: 'Public Domain (NASA)',
              author: 'NASA Editorial',
              publishedAt: pubDate ?? DateTime.now(),
              rawTitle: title,
              rawContent: cleanedContent,
              rawDescription: cleanedContent.length > 120 ? '${cleanedContent.substring(0, 120)}...' : cleanedContent,
              categoryHint: 'Science',
              levelHint: CefrLevel.b2,
            ));
          }
        }
      }
    } catch (_) {}
    return results;
  }
}
