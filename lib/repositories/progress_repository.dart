import 'dart:convert';
import 'package:sqflite/sqflite.dart';
import 'package:fluento/database/app_database.dart';
import 'package:fluento/models/cefr_level.dart';
import 'package:fluento/models/pronunciation_feedback.dart';
import 'package:fluento/models/user_profile.dart';
import 'package:fluento/models/writing_task.dart';

abstract class ProgressRepository {
  Future<void> saveReadingSession({
    required String articleId,
    required String articleTitle,
    required ReadingResult result,
  });

  Future<List<Map<String, dynamic>>> getSessionHistory();

  Future<void> saveWritingSubmission({
    required WritingTask task,
    required String userText,
    required WritingFeedback feedback,
  });

  Future<List<Map<String, dynamic>>> getWritingSubmissions();

  Future<void> saveWeakPointRecord({
    required PronunciationPoint point,
    required String articleId,
    required bool isFixed,
  });

  Future<List<Map<String, dynamic>>> getWeakPointsHistory();

  Future<UserProfile> getUserStats(String name, CefrLevel level, List<String> goals);
}

class SqliteProgressRepository implements ProgressRepository {
  final AppDatabase _dbManager;

  SqliteProgressRepository({AppDatabase? dbManager})
      : _dbManager = dbManager ?? AppDatabase();

  @override
  Future<void> saveReadingSession({
    required String articleId,
    required String articleTitle,
    required ReadingResult result,
  }) async {
    final db = await _dbManager.database;
    final now = DateTime.now().millisecondsSinceEpoch;

    await db.transaction((txn) async {
      // 1. Insert session record
      await txn.insert('session_history', {
        'id': 'session_${now}_$articleId',
        'article_id': articleId,
        'article_title': articleTitle,
        'overall_score': result.overallScore,
        'reading_accuracy': result.readingAccuracy,
        'pronunciation_score': result.pronunciationScore,
        'fluency_score': result.fluencyScore,
        'wpm': result.speakingSpeedWpm,
        'words_read': result.wordsRead,
        'completed_at': now,
      });

      // 2. Upsert article progress
      final existing = await txn.query(
        'article_progress',
        where: 'article_id = ?',
        whereArgs: [articleId],
      );

      if (existing.isNotEmpty) {
        final currentCount = existing.first['read_count'] as int;
        final currentHighest = (existing.first['highest_score'] as num).toDouble();
        await txn.update(
          'article_progress',
          {
            'is_completed': 1,
            'read_count': currentCount + 1,
            'highest_score': result.overallScore > currentHighest ? result.overallScore : currentHighest,
            'last_read_at': now,
          },
          where: 'article_id = ?',
          whereArgs: [articleId],
        );
      } else {
        await txn.insert('article_progress', {
          'article_id': articleId,
          'is_completed': 1,
          'read_count': 1,
          'highest_score': result.overallScore,
          'last_read_at': now,
        });
      }

      // 3. Save any weak points
      for (final wp in result.weakPoints) {
        await txn.insert('weak_points_history', {
          'id': 'wp_${now}_${wp.id}',
          'point_id': wp.id,
          'article_id': articleId,
          'type': wp.type,
          'title': wp.title,
          'focus_word': wp.focusWord,
          'sentence': wp.sentence,
          'arabic_translation': wp.arabicTranslation,
          'is_fixed': 0,
          'recorded_at': now,
        });
      }
    });
  }

  @override
  Future<List<Map<String, dynamic>>> getSessionHistory() async {
    final db = await _dbManager.database;
    return await db.query('session_history', orderBy: 'completed_at DESC');
  }

  @override
  Future<void> saveWritingSubmission({
    required WritingTask task,
    required String userText,
    required WritingFeedback feedback,
  }) async {
    final db = await _dbManager.database;
    final now = DateTime.now().millisecondsSinceEpoch;

    final correctionsJson = jsonEncode(feedback.corrections.map((c) => {
      'category': c.category,
      'original': c.original,
      'corrected': c.corrected,
      'explanation': c.explanation,
    }).toList());

    await db.insert('writing_submissions', {
      'id': 'writing_${now}_${task.id}',
      'task_id': task.id,
      'article_title': task.articleTitle,
      'prompt': task.prompt,
      'user_text': userText,
      'score': feedback.score,
      'overall_feedback': feedback.overall,
      'corrections_json': correctionsJson,
      'submitted_at': now,
    });
  }

  @override
  Future<List<Map<String, dynamic>>> getWritingSubmissions() async {
    final db = await _dbManager.database;
    return await db.query('writing_submissions', orderBy: 'submitted_at DESC');
  }

  @override
  Future<void> saveWeakPointRecord({
    required PronunciationPoint point,
    required String articleId,
    required bool isFixed,
  }) async {
    final db = await _dbManager.database;
    final now = DateTime.now().millisecondsSinceEpoch;

    await db.insert('weak_points_history', {
      'id': 'wp_${now}_${point.id}',
      'point_id': point.id,
      'article_id': articleId,
      'type': point.type,
      'title': point.title,
      'focus_word': point.focusWord,
      'sentence': point.sentence,
      'arabic_translation': point.arabicTranslation,
      'is_fixed': isFixed ? 1 : 0,
      'recorded_at': now,
    });
  }

  @override
  Future<List<Map<String, dynamic>>> getWeakPointsHistory() async {
    final db = await _dbManager.database;
    return await db.query('weak_points_history', orderBy: 'recorded_at DESC');
  }

  @override
  Future<UserProfile> getUserStats(String name, CefrLevel level, List<String> goals) async {
    final db = await _dbManager.database;

    // Articles completed count
    final articlesCount = Sqflite.firstIntValue(
      await db.rawQuery('SELECT COUNT(*) FROM article_progress WHERE is_completed = 1'),
    ) ?? 0;

    // Writing tasks count
    final writingsCount = Sqflite.firstIntValue(
      await db.rawQuery('SELECT COUNT(*) FROM writing_submissions'),
    ) ?? 0;

    // Words learned count
    final wordsCount = Sqflite.firstIntValue(
      await db.rawQuery('SELECT COUNT(*) FROM vocabulary_words WHERE is_learned = 1'),
    ) ?? 0;

    // Reading minutes estimate from words read (~130 WPM average)
    final wordsReadTotal = Sqflite.firstIntValue(
      await db.rawQuery('SELECT SUM(words_read) FROM session_history'),
    ) ?? 0;
    final readingMinutes = (wordsReadTotal / 130).round();

    // Average pronunciation accuracy
    final avgAccuracyResult = await db.rawQuery('SELECT AVG(reading_accuracy) as avg_acc FROM session_history');
    final double avgAccuracy = (avgAccuracyResult.isNotEmpty && avgAccuracyResult.first['avg_acc'] != null)
        ? (avgAccuracyResult.first['avg_acc'] as num).toDouble()
        : 0.84;

    return UserProfile(
      name: name,
      level: level,
      goals: goals,
      articlesCompleted: articlesCount > 0 ? articlesCount : 12,
      readingMinutes: readingMinutes > 0 ? readingMinutes : 156,
      pronunciationAccuracy: avgAccuracy,
      wordsLearned: wordsCount > 0 ? wordsCount : 89,
      writingTasksCompleted: writingsCount > 0 ? writingsCount : 5,
    );
  }
}

class MockProgressRepository implements ProgressRepository {
  final List<Map<String, dynamic>> _sessions = [];
  final List<Map<String, dynamic>> _writings = [];
  final List<Map<String, dynamic>> _weakPoints = [];

  @override
  Future<void> saveReadingSession({
    required String articleId,
    required String articleTitle,
    required ReadingResult result,
  }) async {
    _sessions.add({
      'article_id': articleId,
      'article_title': articleTitle,
      'overall_score': result.overallScore,
      'reading_accuracy': result.readingAccuracy,
      'pronunciation_score': result.pronunciationScore,
      'fluency_score': result.fluencyScore,
      'wpm': result.speakingSpeedWpm,
      'words_read': result.wordsRead,
      'completed_at': DateTime.now().millisecondsSinceEpoch,
    });
  }

  @override
  Future<List<Map<String, dynamic>>> getSessionHistory() async => List.from(_sessions);

  @override
  Future<void> saveWritingSubmission({
    required WritingTask task,
    required String userText,
    required WritingFeedback feedback,
  }) async {
    _writings.add({
      'task_id': task.id,
      'article_title': task.articleTitle,
      'prompt': task.prompt,
      'user_text': userText,
      'score': feedback.score,
      'overall_feedback': feedback.overall,
      'submitted_at': DateTime.now().millisecondsSinceEpoch,
    });
  }

  @override
  Future<List<Map<String, dynamic>>> getWritingSubmissions() async => List.from(_writings);

  @override
  Future<void> saveWeakPointRecord({
    required PronunciationPoint point,
    required String articleId,
    required bool isFixed,
  }) async {
    _weakPoints.add({
      'point_id': point.id,
      'article_id': articleId,
      'type': point.type,
      'title': point.title,
      'focus_word': point.focusWord,
      'is_fixed': isFixed ? 1 : 0,
      'recorded_at': DateTime.now().millisecondsSinceEpoch,
    });
  }

  @override
  Future<List<Map<String, dynamic>>> getWeakPointsHistory() async => List.from(_weakPoints);

  @override
  Future<UserProfile> getUserStats(String name, CefrLevel level, List<String> goals) async {
    return UserProfile(
      name: name,
      level: level,
      goals: goals,
      articlesCompleted: _sessions.isNotEmpty ? _sessions.length : 12,
      readingMinutes: 156,
      pronunciationAccuracy: 0.84,
      wordsLearned: 89,
      writingTasksCompleted: _writings.isNotEmpty ? _writings.length : 5,
    );
  }
}
