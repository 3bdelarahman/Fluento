import 'package:fluento/models/cefr_level.dart';

class UserProfile {
  final String name;
  final CefrLevel level;
  final List<String> goals;
  final int articlesCompleted;
  final int readingMinutes;
  final int wordsLearned;
  final int writingTasksCompleted;
  final double pronunciationAccuracy;

  // Aliases for backward compat
  int get articlesRead => articlesCompleted;
  int get minutesPracticed => readingMinutes;
  double get accuracyRate => pronunciationAccuracy;

  const UserProfile({
    required this.name,
    required this.level,
    this.goals = const [],
    this.articlesCompleted = 0,
    this.readingMinutes = 0,
    this.wordsLearned = 0,
    this.writingTasksCompleted = 0,
    this.pronunciationAccuracy = 0.0,
  });

  UserProfile copyWith({
    String? name,
    CefrLevel? level,
    List<String>? goals,
    int? articlesCompleted,
    int? readingMinutes,
    int? wordsLearned,
    int? writingTasksCompleted,
    double? pronunciationAccuracy,
  }) {
    return UserProfile(
      name: name ?? this.name,
      level: level ?? this.level,
      goals: goals ?? this.goals,
      articlesCompleted: articlesCompleted ?? this.articlesCompleted,
      readingMinutes: readingMinutes ?? this.readingMinutes,
      wordsLearned: wordsLearned ?? this.wordsLearned,
      writingTasksCompleted: writingTasksCompleted ?? this.writingTasksCompleted,
      pronunciationAccuracy: pronunciationAccuracy ?? this.pronunciationAccuracy,
    );
  }
}
