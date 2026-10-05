import 'package:http/http.dart' as http;
import 'package:xml/xml.dart';
import 'package:fluento/models/cefr_level.dart';
import 'package:fluento/services/article_sources/article_source.dart';
import 'package:fluento/services/article_pipeline/text_cleaner.dart';

class VoaLearningEnglishSource implements ArticleSource {
  final http.Client _client;

  VoaLearningEnglishSource({http.Client? client}) : _client = client ?? http.Client();

  @override
  String get id => 'voa_learning_english';

  @override
  String get name => 'VOA Learning English';

  @override
  bool get redistributable => true; // US Public Domain (USAGM / VOA)

  static const List<String> _feedUrls = [
    'https://learningenglish.voanews.com/api/z\$g\$pe_yoq', // Science & Tech
    'https://learningenglish.voanews.com/api/z\$o\$pelyoq', // Education & Society
  ];

  @override
  Future<List<RawArticle>> fetch() async {
    final results = <RawArticle>[];

    for (final url in _feedUrls) {
      try {
        final response = await _client.get(
          Uri.parse(url),
          headers: {'User-Agent': 'Fluento/1.0 (English Learning App)'},
        ).timeout(const Duration(seconds: 10));

        if (response.statusCode == 200) {
          final articles = _parseRss(response.body);
          results.addAll(articles);
        }
      } catch (_) {
        // Source failure handled gracefully: continue to next feed
      }
    }

    return results;
  }

  List<RawArticle> _parseRss(String xmlBody) {
    final list = <RawArticle>[];
    try {
      final document = XmlDocument.parse(xmlBody);
      final items = document.findAllElements('item');

      for (final item in items) {
        final title = item.findElements('title').firstOrNull?.innerText ?? '';
        final link = item.findElements('link').firstOrNull?.innerText ?? '';
        final description = item.findElements('description').firstOrNull?.innerText ?? '';
        final pubDateStr = item.findElements('pubDate').firstOrNull?.innerText;
        final author = item.findElements('author').firstOrNull?.innerText ?? 'VOA Learning English';

        // Check level hint from category or title
        CefrLevel levelHint = CefrLevel.b1;
        final lowerTitle = title.toLowerCase();
        if (lowerTitle.contains('level 1') || lowerTitle.contains('beginning')) {
          levelHint = CefrLevel.a2;
        } else if (lowerTitle.contains('level 2') || lowerTitle.contains('intermediate')) {
          levelHint = CefrLevel.b1;
        } else if (lowerTitle.contains('advanced')) {
          levelHint = CefrLevel.b2;
        }

        DateTime? pubDate;
        if (pubDateStr != null) {
          try {
            pubDate = DateTime.tryParse(pubDateStr);
          } catch (_) {}
        }

        final cleanedContent = TextCleaner.cleanHtml(description);
        if (title.isNotEmpty && cleanedContent.isNotEmpty) {
          list.add(RawArticle(
            sourceId: id,
            sourceName: name,
            sourceUrl: link,
            license: 'Public Domain (USAGM)',
            author: author,
            publishedAt: pubDate,
            rawTitle: title,
            rawContent: cleanedContent,
            rawDescription: cleanedContent.length > 120 ? '${cleanedContent.substring(0, 120)}...' : cleanedContent,
            categoryHint: 'Technology',
            levelHint: levelHint,
          ));
        }
      }
    } catch (_) {}
    return list;
  }
}
