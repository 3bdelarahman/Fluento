import 'package:http/http.dart' as http;
import 'package:xml/xml.dart';
import 'package:fluento/models/cefr_level.dart';
import 'package:fluento/services/article_sources/article_source.dart';
import 'package:fluento/services/article_pipeline/text_cleaner.dart';

class GlobalVoicesSource implements ArticleSource {
  final http.Client _client;

  GlobalVoicesSource({http.Client? client}) : _client = client ?? http.Client();

  @override
  String get id => 'global_voices';

  @override
  String get name => 'Global Voices';

  @override
  bool get redistributable => true; // CC BY 3.0 (with attribution)

  static const String _rssUrl = 'https://globalvoices.org/feed/';

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
          final creator = item.findElements('dc:creator').firstOrNull?.innerText ?? 'Global Voices';

          DateTime? pubDate;
          if (pubDateStr != null) {
            try {
              pubDate = DateTime.tryParse(pubDateStr);
            } catch (_) {}
          }

          final cleaned = TextCleaner.cleanHtml(description);
          if (title.isNotEmpty && cleaned.isNotEmpty) {
            results.add(RawArticle(
              sourceId: id,
              sourceName: name,
              sourceUrl: link,
              license: 'CC BY 3.0 (Global Voices)',
              author: creator,
              publishedAt: pubDate ?? DateTime.now(),
              rawTitle: title,
              rawContent: cleaned,
              rawDescription: cleaned.length > 120 ? '${cleaned.substring(0, 120)}...' : cleaned,
              categoryHint: 'Culture',
              levelHint: CefrLevel.b1,
            ));
          }
        }
      }
    } catch (_) {}
    return results;
  }
}
