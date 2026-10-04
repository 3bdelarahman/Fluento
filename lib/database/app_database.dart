import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as p;

class AppDatabase {
  static const String _databaseName = 'fluento.db';
  static const int _databaseVersion = 1;

  static AppDatabase? _instance;
  static Database? _database;

  AppDatabase._internal();

  factory AppDatabase() {
    _instance ??= AppDatabase._internal();
    return _instance!;
  }

  // Allow injecting an in-memory or mock Database for tests
  static void setTestDatabase(Database? db) {
    _database = db;
  }

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final dbPath = await getDatabasesPath();
    final path = p.join(dbPath, _databaseName);

    return await openDatabase(
      path,
      version: _databaseVersion,
      onCreate: _onCreate,
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    // 1. Vocabulary Bank
    await db.execute('''
      CREATE TABLE vocabulary_words (
        id TEXT PRIMARY KEY,
        word TEXT NOT NULL,
        ipa TEXT NOT NULL,
        meaning TEXT NOT NULL,
        translation TEXT NOT NULL,
        example_sentence TEXT NOT NULL,
        audio_url TEXT,
        is_learned INTEGER NOT NULL DEFAULT 0,
        is_saved INTEGER NOT NULL DEFAULT 0,
        updated_at INTEGER
      )
    ''');

    // 2. Reading Session History
    await db.execute('''
      CREATE TABLE session_history (
        id TEXT PRIMARY KEY,
        article_id TEXT NOT NULL,
        article_title TEXT NOT NULL,
        overall_score REAL NOT NULL,
        reading_accuracy REAL NOT NULL,
        pronunciation_score REAL NOT NULL,
        fluency_score REAL NOT NULL,
        wpm INTEGER NOT NULL,
        words_read INTEGER NOT NULL,
        completed_at INTEGER NOT NULL
      )
    ''');

    // 3. Per-Article Progress
    await db.execute('''
      CREATE TABLE article_progress (
        article_id TEXT PRIMARY KEY,
        is_completed INTEGER NOT NULL DEFAULT 0,
        read_count INTEGER NOT NULL DEFAULT 1,
        highest_score REAL NOT NULL DEFAULT 0.0,
        last_read_at INTEGER NOT NULL
      )
    ''');

    // 4. Weak Points History
    await db.execute('''
      CREATE TABLE weak_points_history (
        id TEXT PRIMARY KEY,
        point_id TEXT NOT NULL,
        article_id TEXT NOT NULL,
        type TEXT NOT NULL,
        title TEXT NOT NULL,
        focus_word TEXT NOT NULL,
        sentence TEXT NOT NULL,
        arabic_translation TEXT NOT NULL,
        is_fixed INTEGER NOT NULL DEFAULT 0,
        recorded_at INTEGER NOT NULL
      )
    ''');

    // 5. Writing Submissions History
    await db.execute('''
      CREATE TABLE writing_submissions (
        id TEXT PRIMARY KEY,
        task_id TEXT NOT NULL,
        article_title TEXT NOT NULL,
        prompt TEXT NOT NULL,
        user_text TEXT NOT NULL,
        score REAL NOT NULL,
        overall_feedback TEXT NOT NULL,
        corrections_json TEXT NOT NULL,
        submitted_at INTEGER NOT NULL
      )
    ''');
  }

  Future<void> close() async {
    if (_database != null && _database!.isOpen) {
      await _database!.close();
      _database = null;
    }
  }
}
