import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';

part 'fluento_database.g.dart';

// 1. Reading Sessions
class ReadingSessionsTable extends Table {
  TextColumn get id => text()();
  TextColumn get articleId => text()();
  TextColumn get articleTitle => text()();
  RealColumn get overallScore => real()();
  RealColumn get readingAccuracy => real()();
  RealColumn get pronunciationScore => real()();
  RealColumn get fluencyScore => real()();
  IntColumn get wpm => integer()();
  IntColumn get wordsRead => integer()();
  DateTimeColumn get completedAt => dateTime()();

  @override
  Set<Column> get primaryKey => {id};
}

// 2. Per-Article Progress
class ArticleProgressTable extends Table {
  TextColumn get articleId => text()();
  BoolColumn get isCompleted => boolean().withDefault(const Constant(false))();
  IntColumn get readCount => integer().withDefault(const Constant(1))();
  RealColumn get highestScore => real().withDefault(const Constant(0.0))();
  DateTimeColumn get lastReadAt => dateTime()();

  @override
  Set<Column> get primaryKey => {articleId};
}

// 3. Reading Results details
class ReadingResultsTable extends Table {
  TextColumn get id => text()();
  TextColumn get sessionId => text()();
  TextColumn get encouragement => text()();

  @override
  Set<Column> get primaryKey => {id};
}

// 4. Weak Points History
class WeakPointsTable extends Table {
  TextColumn get id => text()();
  TextColumn get pointId => text()();
  TextColumn get articleId => text()();
  TextColumn get type => text()();
  TextColumn get title => text()();
  TextColumn get description => text()();
  TextColumn get focusWord => text()();
  TextColumn get sentence => text()();
  TextColumn get sentenceTranslation => text().withDefault(const Constant(''))();
  TextColumn get explanation => text()();
  TextColumn get minLevel => text().withDefault(const Constant('b1'))();
  BoolColumn get isFixed => boolean().withDefault(const Constant(false))();
  IntColumn get attemptCount => integer().withDefault(const Constant(0))();
  DateTimeColumn get recordedAt => dateTime()();

  @override
  Set<Column> get primaryKey => {id};
}

// 5. Vocabulary Bank
class VocabularyEntriesTable extends Table {
  TextColumn get id => text()();
  TextColumn get word => text()();
  TextColumn get ipa => text()();
  TextColumn get meaning => text()();
  TextColumn get translation => text()();
  TextColumn get exampleSentence => text()();
  TextColumn get audioUrl => text().nullable()();
  BoolColumn get isLearned => boolean().withDefault(const Constant(false))();
  BoolColumn get isSaved => boolean().withDefault(const Constant(false))();
  BoolColumn get isBookmarked => boolean().withDefault(const Constant(false))();
  IntColumn get reviewInterval => integer().withDefault(const Constant(1))();
  DateTimeColumn get nextReviewAt => dateTime().nullable()();
  DateTimeColumn get lastReviewedAt => dateTime().nullable()();
  RealColumn get easeFactor => real().withDefault(const Constant(2.5))();
  IntColumn get repetitionCount => integer().withDefault(const Constant(0))();

  @override
  Set<Column> get primaryKey => {id};
}

// 6. Writing Submissions
class WritingSubmissionsTable extends Table {
  TextColumn get id => text()();
  TextColumn get taskId => text()();
  TextColumn get articleTitle => text()();
  TextColumn get prompt => text()();
  TextColumn get userText => text()();
  RealColumn get score => real()();
  TextColumn get overallFeedback => text()();
  TextColumn get correctionsJson => text()();
  DateTimeColumn get submittedAt => dateTime()();

  @override
  Set<Column> get primaryKey => {id};
}

// 7. Spaced Repetition Schedule (SM-2)
class SpacedRepetitionTable extends Table {
  TextColumn get id => text()();
  TextColumn get itemType => text()(); // 'vocabulary' or 'weak_point'
  TextColumn get referenceId => text()();
  TextColumn get promptSentence => text()();
  TextColumn get focusText => text()();
  IntColumn get reviewInterval => integer().withDefault(const Constant(1))();
  RealColumn get easeFactor => real().withDefault(const Constant(2.5))();
  IntColumn get repetitions => integer().withDefault(const Constant(0))();
  DateTimeColumn get nextReviewAt => dateTime()();
  DateTimeColumn get lastReviewedAt => dateTime().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}

// 8. Cached Articles (for Phase 2 pipeline)
class CachedArticlesTable extends Table {
  TextColumn get id => text()();
  TextColumn get sourceName => text()();
  TextColumn get sourceUrl => text()();
  TextColumn get license => text()();
  TextColumn get author => text().withDefault(const Constant('Unknown'))();
  DateTimeColumn get publishedAt => dateTime().nullable()();
  TextColumn get category => text()();
  TextColumn get cefrLevel => text()();
  TextColumn get title => text()();
  TextColumn get description => text()();
  TextColumn get body => text()();
  TextColumn get sentencesJson => text()();
  TextColumn get translationsArJson => text().nullable()();
  TextColumn get writingPrompt => text().nullable()();
  IntColumn get readingMinutes => integer().withDefault(const Constant(5))();
  IntColumn get vocabCount => integer().withDefault(const Constant(10))();
  BoolColumn get isNew => boolean().withDefault(const Constant(true))();
  BoolColumn get isRead => boolean().withDefault(const Constant(false))();
  DateTimeColumn get cachedAt => dateTime()();

  @override
  Set<Column> get primaryKey => {id};
}

// 9. Cached Sentence & Word Data
class CachedSentenceDataTable extends Table {
  TextColumn get id => text()();
  TextColumn get articleId => text()();
  IntColumn get sentenceIndex => integer()();
  TextColumn get textContent => text()();
  TextColumn get translationAr => text().nullable()();
  TextColumn get audioUrl => text().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}

@DriftDatabase(tables: [
  ReadingSessionsTable,
  ArticleProgressTable,
  ReadingResultsTable,
  WeakPointsTable,
  VocabularyEntriesTable,
  WritingSubmissionsTable,
  SpacedRepetitionTable,
  CachedArticlesTable,
  CachedSentenceDataTable,
])
class FluentoDatabase extends _$FluentoDatabase {
  FluentoDatabase([QueryExecutor? executor])
      : super(executor ?? driftDatabase(name: 'fluento_drift'));

  @override
  int get schemaVersion => 1;
}
