import 'package:flutter/material.dart';
import 'package:fluento/models/cefr_level.dart';
import 'package:fluento/models/pronunciation_feedback.dart';
import 'package:fluento/models/user_profile.dart';
import 'package:fluento/models/vocabulary.dart';
import 'package:fluento/models/writing_task.dart';
import 'package:fluento/data/sample_vocabulary.dart';
import 'package:fluento/repositories/settings_repository.dart';
import 'package:fluento/repositories/vocabulary_repository.dart';
import 'package:fluento/repositories/progress_repository.dart';

class AppState extends ChangeNotifier {
  final SettingsRepository _settingsRepo;
  final VocabularyRepository _vocabRepo;
  final ProgressRepository _progressRepo;

  bool _isInitialized = false;

  bool onboardingComplete = false;
  bool isDarkMode = false;
  CefrLevel currentLevel = CefrLevel.b1;
  List<String> learningGoals = ['Speaking', 'Pronunciation'];

  UserProfile userProfile = const UserProfile(
    name: 'Abdelrahman',
    level: CefrLevel.b1,
    goals: ['Speaking', 'Pronunciation'],
    articlesCompleted: 12,
    readingMinutes: 156,
    pronunciationAccuracy: 0.84,
    wordsLearned: 89,
    writingTasksCompleted: 5,
  );

  List<VocabularyWord> vocabularyWords = List.from(sampleVocabulary);
  int currentArticleIndex = 0;
  String currentScreen = 'onboarding';

  AppState({
    SettingsRepository? settingsRepo,
    VocabularyRepository? vocabRepo,
    ProgressRepository? progressRepo,
    bool autoInit = true,
  })  : _settingsRepo = settingsRepo ?? SharedPrefsSettingsRepository(),
        _vocabRepo = vocabRepo ?? SqliteVocabularyRepository(),
        _progressRepo = progressRepo ?? SqliteProgressRepository() {
    if (autoInit) {
      init();
    }
  }

  bool get isInitialized => _isInitialized;

  /// Loads persisted settings and SQLite databases on startup
  Future<void> init() async {
    try {
      // 1. Load settings from SharedPreferences
      onboardingComplete = await _settingsRepo.isOnboardingCompleted();
      isDarkMode = await _settingsRepo.isDarkMode();
      currentLevel = await _settingsRepo.getCefrLevel();
      learningGoals = await _settingsRepo.getLearningGoals();
      final userName = await _settingsRepo.getUserName();

      // 2. Load & seed vocabulary from local DB
      await _vocabRepo.seedInitialWords(sampleVocabulary);
      final storedWords = await _vocabRepo.getAllWords();
      if (storedWords.isNotEmpty) {
        vocabularyWords = storedWords;
      }

      // 3. Load dynamic stats from progress repository
      userProfile = await _progressRepo.getUserStats(userName, currentLevel, learningGoals);

      _isInitialized = true;
      notifyListeners();
    } catch (_) {
      // Graceful fallback to initial defaults if running in restricted environments
      _isInitialized = true;
    }
  }

  Future<void> completeOnboarding() async {
    onboardingComplete = true;
    notifyListeners();
    await _settingsRepo.setOnboardingCompleted(true);
  }

  Future<void> setLevel(CefrLevel level) async {
    currentLevel = level;
    userProfile = userProfile.copyWith(level: level);
    notifyListeners();
    await _settingsRepo.setCefrLevel(level);
  }

  Future<void> setGoals(List<String> goals) async {
    learningGoals = List.from(goals);
    userProfile = userProfile.copyWith(goals: learningGoals);
    notifyListeners();
    await _settingsRepo.setLearningGoals(learningGoals);
  }

  Future<void> toggleDarkMode() async {
    isDarkMode = !isDarkMode;
    notifyListeners();
    await _settingsRepo.setDarkMode(isDarkMode);
  }

  Future<void> toggleVocabSaved(int index) async {
    if (index >= 0 && index < vocabularyWords.length) {
      final word = vocabularyWords[index];
      final newSaved = !word.isSaved;
      vocabularyWords[index] = word.copyWith(isSaved: newSaved);
      notifyListeners();
      await _vocabRepo.toggleSaved(word.id.isNotEmpty ? word.id : word.word, newSaved);
    }
  }

  Future<void> toggleVocabLearned(int index) async {
    if (index >= 0 && index < vocabularyWords.length) {
      final word = vocabularyWords[index];
      final newLearned = !word.isLearned;
      vocabularyWords[index] = word.copyWith(isLearned: newLearned);
      notifyListeners();
      await _vocabRepo.toggleLearned(word.id.isNotEmpty ? word.id : word.word, newLearned);
    }
  }

  Future<void> recordReadingSession({
    required String articleId,
    required String articleTitle,
    required ReadingResult result,
  }) async {
    await _progressRepo.saveReadingSession(
      articleId: articleId,
      articleTitle: articleTitle,
      result: result,
    );
    userProfile = await _progressRepo.getUserStats(
      userProfile.name,
      currentLevel,
      learningGoals,
    );
    notifyListeners();
  }

  Future<void> recordWritingSubmission({
    required WritingTask task,
    required String userText,
    required WritingFeedback feedback,
  }) async {
    await _progressRepo.saveWritingSubmission(
      task: task,
      userText: userText,
      feedback: feedback,
    );
    userProfile = await _progressRepo.getUserStats(
      userProfile.name,
      currentLevel,
      learningGoals,
    );
    notifyListeners();
  }
}
