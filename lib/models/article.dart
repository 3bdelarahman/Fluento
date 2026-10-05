import 'dart:convert';
import 'package:fluento/models/cefr_level.dart';

class Article {
  final String id;
  final String title;
  final String description;
  final String content;
  final String topic;
  final String imageEmoji;
  final CefrLevel level;
  final int readingTimeMinutes;
  final int newWordsCount;

  // Extended Source & Pedagogical Metadata
  final String sourceName;
  final String sourceUrl;
  final String license;
  final String author;
  final DateTime? publishedAt;
  final List<String>? sentences;
  final List<String>? translationsAr;
  final String? writingPrompt;
  final bool isNew;

  // Aliases for compatibility
  String get category => topic;
  String get body => content;
  int get estimatedReadingTimeMinutes => readingTimeMinutes;
  int get vocabCount => newWordsCount;

  const Article({
    required this.id,
    required this.title,
    required this.description,
    required this.content,
    required this.topic,
    required this.imageEmoji,
    required this.level,
    required this.readingTimeMinutes,
    required this.newWordsCount,
    this.sourceName = 'Fluento Curated',
    this.sourceUrl = '',
    this.license = 'CC BY-SA 4.0',
    this.author = 'Fluento Editorial',
    this.publishedAt,
    this.sentences,
    this.translationsAr,
    this.writingPrompt,
    this.isNew = false,
  });

  List<String> get paragraphs {
    return content.split('\n\n').where((p) => p.trim().isNotEmpty).toList();
  }

  List<String> get sentenceList {
    if (sentences != null && sentences!.isNotEmpty) {
      return sentences!;
    }
    // Fallback sentence splitter
    final regex = RegExp(r'(?<=[.!?])\s+(?=[A-Z0-9])');
    return content
        .replaceAll('\n\n', ' ')
        .split(regex)
        .map((s) => s.trim())
        .where((s) => s.isNotEmpty)
        .toList();
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'content': content,
      'topic': topic,
      'imageEmoji': imageEmoji,
      'level': level.name,
      'readingTimeMinutes': readingTimeMinutes,
      'newWordsCount': newWordsCount,
      'sourceName': sourceName,
      'sourceUrl': sourceUrl,
      'license': license,
      'author': author,
      'publishedAt': publishedAt?.toIso8601String(),
      'sentences': sentences ?? sentenceList,
      'translationsAr': translationsAr,
      'writingPrompt': writingPrompt,
      'isNew': isNew,
    };
  }

  factory Article.fromJson(Map<String, dynamic> json) {
    CefrLevel parsedLevel = CefrLevel.b1;
    final levelStr = (json['level'] ?? json['cefrLevel'] ?? 'b1').toString().toLowerCase();
    for (final l in CefrLevel.values) {
      if (l.name == levelStr || l.label.toLowerCase() == levelStr) {
        parsedLevel = l;
        break;
      }
    }

    final rawSentences = json['sentences'] ?? json['sentencesJson'];
    List<String>? parsedSentences;
    if (rawSentences is List) {
      parsedSentences = rawSentences.map((e) => e.toString()).toList();
    } else if (rawSentences is String && rawSentences.isNotEmpty) {
      try {
        final decoded = jsonDecode(rawSentences);
        if (decoded is List) {
          parsedSentences = decoded.map((e) => e.toString()).toList();
        }
      } catch (_) {}
    }

    final rawTranslations = json['translationsAr'] ?? json['translationsArJson'];
    List<String>? parsedTranslations;
    if (rawTranslations is List) {
      parsedTranslations = rawTranslations.map((e) => e.toString()).toList();
    } else if (rawTranslations is String && rawTranslations.isNotEmpty) {
      try {
        final decoded = jsonDecode(rawTranslations);
        if (decoded is List) {
          parsedTranslations = decoded.map((e) => e.toString()).toList();
        }
      } catch (_) {}
    }

    DateTime? publishedDate;
    if (json['publishedAt'] != null) {
      try {
        publishedDate = DateTime.parse(json['publishedAt'].toString());
      } catch (_) {}
    }

    final bodyContent = (json['content'] ?? json['body'] ?? '').toString();

    return Article(
      id: (json['id'] ?? '').toString(),
      title: (json['title'] ?? '').toString(),
      description: (json['description'] ?? '').toString(),
      content: bodyContent,
      topic: (json['topic'] ?? json['category'] ?? 'General').toString(),
      imageEmoji: (json['imageEmoji'] ?? '📖').toString(),
      level: parsedLevel,
      readingTimeMinutes: (json['readingTimeMinutes'] ?? json['readingMinutes'] ?? 5) as int,
      newWordsCount: (json['newWordsCount'] ?? json['vocabCount'] ?? 8) as int,
      sourceName: (json['sourceName'] ?? 'Fluento Curated').toString(),
      sourceUrl: (json['sourceUrl'] ?? '').toString(),
      license: (json['license'] ?? 'CC BY-SA 4.0').toString(),
      author: (json['author'] ?? 'Fluento Editorial').toString(),
      publishedAt: publishedDate,
      sentences: parsedSentences,
      translationsAr: parsedTranslations,
      writingPrompt: json['writingPrompt']?.toString(),
      isNew: (json['isNew'] ?? false) as bool,
    );
  }
}
