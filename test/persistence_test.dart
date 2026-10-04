import 'package:flutter_test/flutter_test.dart';
import 'package:fluento/models/cefr_level.dart';
import 'package:fluento/models/vocabulary.dart';
import 'package:fluento/models/pronunciation_feedback.dart';
import 'package:fluento/models/writing_task.dart';
import 'package:fluento/repositories/settings_repository.dart';
import 'package:fluento/repositories/vocabulary_repository.dart';
import 'package:fluento/repositories/progress_repository.dart';
import 'package:fluento/providers/profile_provider.dart';
import 'package:fluento/providers/vocabulary_provider.dart';
import 'package:fluento/providers/progress_provider.dart';
import 'package:fluento/providers/app_state.dart';

void main() {
  group('Phase 1 — Persistence Tests', () {
    test('SettingsRepository persists and updates user configurations', () async {
      final repo = MockSettingsRepository();

      expect(await repo.isOnboardingCompleted(), isFalse);
      expect(await repo.isDarkMode(), isFalse);
      expect(await repo.getCefrLevel(), equals(CefrLevel.b1));

      await repo.setOnboardingCompleted(true);
      await repo.setDarkMode(true);
      await repo.setCefrLevel(CefrLevel.c1);
      await repo.setLearningGoals(['Speaking', 'Fluency']);
      await repo.setUserName('Omar');

      expect(await repo.isOnboardingCompleted(), isTrue);
      expect(await repo.isDarkMode(), isTrue);
      expect(await repo.getCefrLevel(), equals(CefrLevel.c1));
      expect(await repo.getLearningGoals(), contains('Fluency'));
      expect(await repo.getUserName(), equals('Omar'));
    });

    test('VocabularyRepository handles upsert, toggleSaved and toggleLearned', () async {
      final initialWord = const VocabularyWord(
        id: 'test_word_1',
        word: 'development',
        ipa: '/dɪˈveləpmənt/',
        meaning: 'Growth',
        translation: 'تطور',
        exampleSentence: 'Rapid development of AI.',
        isSaved: false,
        isLearned: false,
      );

      final repo = MockVocabularyRepository([initialWord]);

      final words = await repo.getAllWords();
      expect(words.length, equals(1));
      expect(words.first.isSaved, isFalse);

      await repo.toggleSaved('test_word_1', true);
      final updatedSaved = await repo.getAllWords();
      expect(updatedSaved.first.isSaved, isTrue);

      await repo.toggleLearned('test_word_1', true);
      final updatedLearned = await repo.getAllWords();
      expect(updatedLearned.first.isLearned, isTrue);
    });

    test('ProgressRepository tracks sessions, writings and weak points', () async {
      final repo = MockProgressRepository();

      final readingResult = const ReadingResult(
        overallScore: 0.90,
        readingAccuracy: 0.95,
        pronunciationScore: 0.88,
        fluencyScore: 0.85,
        speakingSpeedWpm: 135,
        wordsRead: 500,
        encouragement: 'Great read!',
      );

      await repo.saveReadingSession(
        articleId: 'art_1',
        articleTitle: 'AI in daily life',
        result: readingResult,
      );

      final sessions = await repo.getSessionHistory();
      expect(sessions.length, equals(1));
      expect(sessions.first['article_title'], equals('AI in daily life'));

      const writingTask = WritingTask(
        id: 'w_1',
        prompt: 'Describe your day',
        articleTitle: 'AI in daily life',
      );
      const writingFeedback = WritingFeedback(
        overall: 'Good job',
        score: 0.85,
        corrections: [],
      );

      await repo.saveWritingSubmission(
        task: writingTask,
        userText: 'My day with AI',
        feedback: writingFeedback,
      );

      final writings = await repo.getWritingSubmissions();
      expect(writings.length, equals(1));
      expect(writings.first['prompt'], equals('Describe your day'));

      const weakPoint = PronunciationPoint(
        id: 'p1',
        sentence: 'Practice makes perfect',
        focusWord: 'perfect',
        explanation: 'Stress first syllable',
      );

      await repo.saveWeakPointRecord(
        point: weakPoint,
        articleId: 'art_1',
        isFixed: true,
      );

      final weakPoints = await repo.getWeakPointsHistory();
      expect(weakPoints.length, equals(1));
      expect(weakPoints.first['is_fixed'], equals(1));
    });

    test('ProfileProvider loads from repository and emits changes', () async {
      final repo = MockSettingsRepository(
        onboardingCompleted: false,
        cefrLevel: CefrLevel.a2,
      );
      final provider = ProfileProvider(settingsRepository: repo);

      await provider.init();
      expect(provider.onboardingComplete, isFalse);
      expect(provider.currentLevel, equals(CefrLevel.a2));

      await provider.setLevel(CefrLevel.b2);
      expect(provider.currentLevel, equals(CefrLevel.b2));
      expect(await repo.getCefrLevel(), equals(CefrLevel.b2));

      await provider.completeOnboarding();
      expect(provider.onboardingComplete, isTrue);
      expect(await repo.isOnboardingCompleted(), isTrue);
    });

    test('VocabularyProvider manages words list and notifies listeners', () async {
      final repo = MockVocabularyRepository([
        const VocabularyWord(
          id: 'v1',
          word: 'artificial',
          ipa: '/ˌɑːrtɪˈfɪʃl/',
          meaning: 'Man-made',
          translation: 'اصطناعي',
          exampleSentence: 'AI is artificial.',
        ),
      ]);

      final provider = VocabularyProvider(repository: repo);
      await provider.init();

      expect(provider.vocabularyWords.length, equals(1));
      expect(provider.savedWords.isEmpty, isTrue);

      await provider.toggleSaved(0);
      expect(provider.savedWords.length, equals(1));

      await provider.toggleLearned(0);
      expect(provider.learnedWords.length, equals(1));
    });

    test('ProgressProvider records sessions and updates state', () async {
      final repo = MockProgressRepository();
      final provider = ProgressProvider(repository: repo);

      await provider.init();
      expect(provider.sessionHistory.isEmpty, isTrue);

      const result = ReadingResult(
        overallScore: 0.88,
        readingAccuracy: 0.92,
        pronunciationScore: 0.86,
        fluencyScore: 0.85,
        speakingSpeedWpm: 125,
        wordsRead: 450,
        encouragement: 'Well done',
      );

      await provider.recordReadingSession(
        articleId: 'art_101',
        articleTitle: 'Machine Learning',
        result: result,
      );

      expect(provider.sessionHistory.length, equals(1));
      expect(provider.sessionHistory.first['article_title'], equals('Machine Learning'));
    });

    test('AppState integrates repositories and syncs state changes', () async {
      final settingsRepo = MockSettingsRepository(
        onboardingCompleted: true,
        cefrLevel: CefrLevel.b2,
        darkMode: true,
      );
      final vocabRepo = MockVocabularyRepository();
      final progressRepo = MockProgressRepository();

      final appState = AppState(
        settingsRepo: settingsRepo,
        vocabRepo: vocabRepo,
        progressRepo: progressRepo,
        autoInit: false,
      );

      await appState.init();

      expect(appState.onboardingComplete, isTrue);
      expect(appState.isDarkMode, isTrue);
      expect(appState.currentLevel, equals(CefrLevel.b2));

      await appState.setLevel(CefrLevel.c1);
      expect(appState.currentLevel, equals(CefrLevel.c1));
      expect(await settingsRepo.getCefrLevel(), equals(CefrLevel.c1));

      await appState.toggleDarkMode();
      expect(appState.isDarkMode, isFalse);
      expect(await settingsRepo.isDarkMode(), isFalse);
    });
  });
}
