import 'package:fluento/models/cefr_level.dart';

class RawArticle {
  final String sourceId;
  final String sourceName;
  final String sourceUrl;
  final String license;
  final String author;
  final DateTime? publishedAt;
  final String rawTitle;
  final String rawContent;
  final String? rawDescription;
  final String? categoryHint;
  final CefrLevel? levelHint;

  const RawArticle({
    required this.sourceId,
    required this.sourceName,
    required this.sourceUrl,
    required this.license,
    required this.author,
    this.publishedAt,
    required this.rawTitle,
    required this.rawContent,
    this.rawDescription,
    this.categoryHint,
    this.levelHint,
  });
}

abstract class ArticleSource {
  String get id;
  String get name;
  bool get redistributable;
  Future<List<RawArticle>> fetch();
}
