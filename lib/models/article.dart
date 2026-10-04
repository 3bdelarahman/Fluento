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

  // Aliases for compatibility
  String get category => topic;
  int get estimatedReadingTimeMinutes => readingTimeMinutes;

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
  });

  List<String> get paragraphs {
    return content.split('\n\n').where((p) => p.trim().isNotEmpty).toList();
  }
}
