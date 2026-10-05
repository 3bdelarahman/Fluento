import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:fluento/models/cefr_level.dart';
import 'package:fluento/services/article_sources/article_source.dart';
import 'package:fluento/services/article_pipeline/text_cleaner.dart';

class WikipediaSource implements ArticleSource {
  final http.Client _client;

  WikipediaSource({http.Client? client}) : _client = client ?? http.Client();

  @override
  String get id => 'wikipedia';

  @override
  String get name => 'Wikipedia (The Free Encyclopedia)';

  @override
  bool get redistributable => true; // CC BY-SA 4.0 with attribution

  static const List<Map<String, String>> _curatedTopics = [
    {'title': 'Artificial_intelligence', 'category': 'Technology', 'level': 'b2'},
    {'title': 'Solar_System', 'category': 'Science', 'level': 'b1'},
    {'title': 'Climate_change', 'category': 'Environment', 'level': 'b2'},
    {'title': 'Coffee', 'category': 'Daily Life', 'level': 'a2'},
    {'title': 'Renaissance', 'category': 'Culture', 'level': 'b2'},
    {'title': 'Electric_vehicle', 'category': 'Technology', 'level': 'b1'},
    {'title': 'Mount_Everest', 'category': 'Travel', 'level': 'b1'},
    {'title': 'Sleep', 'category': 'Health', 'level': 'a2'},
    {'title': 'Global_economy', 'category': 'Business', 'level': 'c1'},
  ];

  @override
  Future<List<RawArticle>> fetch() async {
    final results = <RawArticle>[];

    for (final topic in _curatedTopics) {
      try {
        final url = 'https://en.wikipedia.org/api/rest_v1/page/summary/${topic['title']}';
        final response = await _client.get(
          Uri.parse(url),
          headers: {'User-Agent': 'Fluento/1.0 (English Learning App; mailto:contact@fluento.app)'},
        ).timeout(const Duration(seconds: 8));

        if (response.statusCode == 200) {
          final data = jsonDecode(response.body);
          final title = data['title']?.toString() ?? '';
          final extract = data['extract']?.toString() ?? '';
          final pageUrl = data['content_urls']?['desktop']?['page']?.toString() ??
              'https://en.wikipedia.org/wiki/${topic['title']}';

          if (title.isNotEmpty && extract.length >= 150) {
            final cleaned = TextCleaner.cleanHtml(extract);
            results.add(RawArticle(
              sourceId: id,
              sourceName: name,
              sourceUrl: pageUrl,
              license: 'CC BY-SA 4.0 (Wikipedia Contributors)',
              author: 'Wikipedia Contributors',
              publishedAt: DateTime.now(),
              rawTitle: title,
              rawContent: cleaned,
              rawDescription: data['description']?.toString() ?? 'Encyclopedic article on $title',
              categoryHint: topic['category'],
              levelHint: _parseLevel(topic['level']),
            ));
          }
        }
      } catch (_) {
        // Individual topic failure handled gracefully
      }
    }

    return results;
  }

  CefrLevel _parseLevel(String? lvl) {
    switch (lvl) {
      case 'a1':
        return CefrLevel.a1;
      case 'a2':
        return CefrLevel.a2;
      case 'b1':
        return CefrLevel.b1;
      case 'b2':
        return CefrLevel.b2;
      case 'c1':
        return CefrLevel.c1;
      default:
        return CefrLevel.b1;
    }
  }
}
