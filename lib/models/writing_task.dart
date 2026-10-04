import 'package:fluento/models/cefr_level.dart';

class WritingTask {
  final String id;
  final String prompt;
  final String articleTitle;
  final int minWords;
  final int maxWords;
  final CefrLevel level;

  String get title => articleTitle.isNotEmpty ? articleTitle : prompt;
  String get description => prompt;
  int get targetWordCount => maxWords;

  const WritingTask({
    this.id = '',
    required this.prompt,
    required this.articleTitle,
    this.minWords = 100,
    this.maxWords = 150,
    this.level = CefrLevel.b1,
  });
}

class WritingFeedback {
  final String overall;
  final double score;
  final List<WritingCorrection> corrections;

  double get overallScore => (score <= 1.0 ? score * 100 : score);

  const WritingFeedback({
    required this.overall,
    required this.score,
    required this.corrections,
  });
}

class WritingCorrection {
  final String category;
  final String original;
  final String corrected;
  final String explanation;

  String get type => category;
  String get originalText => original;
  String get correctedText => corrected;

  const WritingCorrection({
    required this.category,
    required this.original,
    required this.corrected,
    required this.explanation,
  });
}
