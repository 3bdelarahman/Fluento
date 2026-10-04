import 'package:flutter/material.dart';
import 'package:fluento/models/cefr_level.dart';
import 'package:fluento/models/pronunciation_feedback.dart';
import 'package:fluento/models/user_profile.dart';
import 'package:fluento/models/writing_task.dart';
import 'package:fluento/repositories/progress_repository.dart';

class ProgressProvider extends ChangeNotifier {
  final ProgressRepository _repository;

  bool _isInitialized = false;
  List<Map<String, dynamic>> _sessionHistory = [];
  List<Map<String, dynamic>> _writingSubmissions = [];
  List<Map<String, dynamic>> _weakPointsHistory = [];

  ProgressProvider({ProgressRepository? repository})
      : _repository = repository ?? SqliteProgressRepository();

  bool get isInitialized => _isInitialized;
  List<Map<String, dynamic>> get sessionHistory => List.unmodifiable(_sessionHistory);
  List<Map<String, dynamic>> get writingSubmissions => List.unmodifiable(_writingSubmissions);
  List<Map<String, dynamic>> get weakPointsHistory => List.unmodifiable(_weakPointsHistory);

  Future<void> init() async {
    if (_isInitialized) return;
    _sessionHistory = await _repository.getSessionHistory();
    _writingSubmissions = await _repository.getWritingSubmissions();
    _weakPointsHistory = await _repository.getWeakPointsHistory();
    _isInitialized = true;
    notifyListeners();
  }

  Future<void> recordReadingSession({
    required String articleId,
    required String articleTitle,
    required ReadingResult result,
  }) async {
    await _repository.saveReadingSession(
      articleId: articleId,
      articleTitle: articleTitle,
      result: result,
    );
    _sessionHistory = await _repository.getSessionHistory();
    notifyListeners();
  }

  Future<void> recordWritingSubmission({
    required WritingTask task,
    required String userText,
    required WritingFeedback feedback,
  }) async {
    await _repository.saveWritingSubmission(
      task: task,
      userText: userText,
      feedback: feedback,
    );
    _writingSubmissions = await _repository.getWritingSubmissions();
    notifyListeners();
  }

  Future<void> recordWeakPoint({
    required PronunciationPoint point,
    required String articleId,
    required bool isFixed,
  }) async {
    await _repository.saveWeakPointRecord(
      point: point,
      articleId: articleId,
      isFixed: isFixed,
    );
    _weakPointsHistory = await _repository.getWeakPointsHistory();
    notifyListeners();
  }

  Future<UserProfile> getUserStats(String name, CefrLevel level, List<String> goals) async {
    return await _repository.getUserStats(name, level, goals);
  }
}
