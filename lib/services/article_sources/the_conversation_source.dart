import 'package:http/http.dart' as http;
import 'package:xml/xml.dart';
import 'package:fluento/models/cefr_level.dart';
import 'package:fluento/services/article_sources/article_source.dart';
import 'package:fluento/services/article_pipeline/text_cleaner.dart';

class TheConversationSource implements ArticleSource {
  final http.Client _client;

  TheConversationSource({http.Client? client}) : _client = client ?? http.Client();

  @override
  String get id => 'the_conversation';

  @override
  String get name => 'The Conversation';

  // CC BY-ND (no derivatives): must remain unmodified, do NOT translate or simplify
  @override
  bool get redistributable => false;

  static const String _feedUrl = 'https://theconversation.com/global/articles.atom';

  @override
  Future<List<RawArticle>> fetch() async {
    final results = <RawArticle>[];
    try {
      final response = await _client.get(
        Uri.parse(_feedUrl),
        headers: {'User-Agent': 'Fluento/1.0 (English Learning App)'},
      ).timeout(const Duration(seconds: 10));

      if (response.statusCode == 200) {
        final document = XmlDocument.parse(response.body);
        final entries = document.findAllElements('entry');

        for (final entry in entries) {
          final title = entry.findElements('title').firstOrNull?.innerText ?? '';
          final link = entry.findElements('link').firstOrNull?.getAttribute('href') ?? '';
          final summary = entry.findElements('summary').firstOrNull?.innerText ??
              entry.findElements('content').firstOrNull?.innerText ?? '';
          final updatedStr = entry.findElements('updated').firstOrNull?.innerText;
          final author = entry.findAllElements('author').firstOrNull?.findElements('name').firstOrNull?.innerText ?? 'The Conversation';

          DateTime? updatedDate;
          if (updatedStr != null) {
            try {
              updatedDate = DateTime.tryParse(updatedStr);
            } catch (_) {}
          }

          final cleaned = TextCleaner.cleanHtml(summary);
          if (title.isNotEmpty && cleaned.isNotEmpty) {
            results.add(RawArticle(
              sourceId: id,
              sourceName: name,
              sourceUrl: link,
              license: 'CC BY-ND 4.0 (Unmodified with Attribution)',
              author: author,
              publishedAt: updatedDate ?? DateTime.now(),
              rawTitle: title,
              rawContent: cleaned,
              rawDescription: cleaned.length > 120 ? '${cleaned.substring(0, 120)}...' : cleaned,
              categoryHint: 'Society',
              levelHint: CefrLevel.b2,
            ));
          }
        }
      }
    } catch (_) {}
    return results;
  }
}
