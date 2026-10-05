import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:fluento/models/article.dart';
import 'package:fluento/services/article_sources/article_source.dart';

class RemoteJsonArticleSource implements ArticleSource {
  final http.Client _client;
  final String jsonUrl;

  RemoteJsonArticleSource({
    http.Client? client,
    String? url,
  })  : _client = client ?? http.Client(),
        jsonUrl = url ?? const String.fromEnvironment(
          'ARTICLES_JSON_URL',
          defaultValue: 'https://3bdelarahman.github.io/Fluento/articles.json',
        );

  @override
  String get id => 'remote_json';

  @override
  String get name => 'Fluento Official Feed';

  @override
  bool get redistributable => true;

  @override
  Future<List<RawArticle>> fetch() async {
    final articles = await fetchArticles();
    return articles.map((a) => RawArticle(
      sourceId: a.sourceName,
      sourceName: a.sourceName,
      sourceUrl: a.sourceUrl,
      license: a.license,
      author: a.author,
      publishedAt: a.publishedAt,
      rawTitle: a.title,
      rawContent: a.content,
      rawDescription: a.description,
      categoryHint: a.category,
      levelHint: a.level,
    )).toList();
  }

  Future<List<Article>> fetchArticles() async {
    try {
      final response = await _client.get(
        Uri.parse(jsonUrl),
        headers: {'User-Agent': 'Fluento/1.0 (English Learning App)'},
      ).timeout(const Duration(seconds: 12));

      if (response.statusCode == 200) {
        final data = jsonDecode(utf8.decode(response.bodyBytes));
        if (data is List) {
          return data
              .map((item) => Article.fromJson(item as Map<String, dynamic>))
              .toList();
        } else if (data is Map && data['articles'] is List) {
          return (data['articles'] as List)
              .map((item) => Article.fromJson(item as Map<String, dynamic>))
              .toList();
        }
      }
    } catch (_) {
      // Remote JSON network error handled gracefully
    }
    return [];
  }
}
