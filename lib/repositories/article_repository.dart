import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'package:sqflite/sqflite.dart';
import 'package:fluento/models/article.dart';
import 'package:fluento/models/cefr_level.dart';
import 'package:fluento/database/app_database.dart';
import 'package:fluento/repositories/settings_repository.dart';
import 'package:fluento/services/article_sources/article_source.dart';
import 'package:fluento/services/article_sources/voa_source.dart';
import 'package:fluento/services/article_sources/wikipedia_source.dart';
import 'package:fluento/services/article_sources/remote_json_source.dart';
import 'package:fluento/services/article_pipeline/article_pipeline.dart';

abstract class ArticleRepository {
  Future<List<Article>> getArticles({
    String? category,
    CefrLevel? level,
    String? searchQuery,
    int? limit,
  });

  Future<Article?> getArticleById(String id);

  Future<void> refreshArticles({bool force = false});

  Future<void> markArticleAsRead(String id);

  Future<int> getCachedArticlesCount();
}

class SqliteArticleRepository implements ArticleRepository {
  final AppDatabase _dbManager;
  final SettingsRepository _settingsRepository;
  final List<ArticleSource> _sources;
  final RemoteJsonArticleSource _remoteJsonSource;
  final ArticlePipeline _pipeline;

  bool _isSeeded = false;

  SqliteArticleRepository({
    AppDatabase? dbManager,
    SettingsRepository? settingsRepository,
    List<ArticleSource>? sources,
    RemoteJsonArticleSource? remoteJsonSource,
    ArticlePipeline? pipeline,
  })  : _dbManager = dbManager ?? AppDatabase(),
        _settingsRepository = settingsRepository ?? SharedPrefsSettingsRepository(),
        _remoteJsonSource = remoteJsonSource ?? RemoteJsonArticleSource(),
        _sources = sources ?? [
          VoaLearningEnglishSource(),
          WikipediaSource(),
        ],
        _pipeline = pipeline ?? ArticlePipeline();

  Future<void> _ensureSeeded() async {
    if (_isSeeded) return;
    final db = await _dbManager.database;

    // Check if table cached_articles already exists and has records
    await db.execute('''
      CREATE TABLE IF NOT EXISTS cached_articles (
        id TEXT PRIMARY KEY,
        source_name TEXT NOT NULL,
        source_url TEXT NOT NULL,
        license TEXT NOT NULL,
        author TEXT NOT NULL,
        published_at INTEGER,
        category TEXT NOT NULL,
        cefr_level TEXT NOT NULL,
        title TEXT NOT NULL,
        description TEXT NOT NULL,
        body TEXT NOT NULL,
        sentences_json TEXT NOT NULL,
        translations_ar_json TEXT,
        writing_prompt TEXT,
        reading_minutes INTEGER NOT NULL,
        vocab_count INTEGER NOT NULL,
        is_new INTEGER NOT NULL DEFAULT 1,
        is_read INTEGER NOT NULL DEFAULT 0,
        cached_at INTEGER NOT NULL
      )
    ''');

    final count = Sqflite.firstIntValue(
      await db.rawQuery('SELECT COUNT(*) FROM cached_articles'),
    ) ?? 0;

    if (count == 0) {
      // Load bundled seed articles from assets
      await _loadSeedArticles(db);
    }

    _isSeeded = true;
  }

  Future<void> _loadSeedArticles(Database db) async {
    try {
      final jsonString = await rootBundle.loadString('assets/articles/seed_articles.json');
      final dynamic decoded = jsonDecode(jsonString);
      final List rawList = decoded is List ? decoded : (decoded['articles'] as List? ?? []);

      final batch = db.batch();
      final now = DateTime.now().millisecondsSinceEpoch;

      for (final item in rawList) {
        final article = Article.fromJson(item as Map<String, dynamic>);
        batch.insert(
          'cached_articles',
          {
            'id': article.id,
            'source_name': article.sourceName,
            'source_url': article.sourceUrl,
            'license': article.license,
            'author': article.author,
            'published_at': article.publishedAt?.millisecondsSinceEpoch ?? now,
            'category': article.category,
            'cefr_level': article.level.name,
            'title': article.title,
            'description': article.description,
            'body': article.content,
            'sentences_json': jsonEncode(article.sentenceList),
            'translations_ar_json': article.translationsAr != null ? jsonEncode(article.translationsAr) : null,
            'writing_prompt': article.writingPrompt,
            'reading_minutes': article.readingTimeMinutes,
            'vocab_count': article.newWordsCount,
            'is_new': 0,
            'is_read': 0,
            'cached_at': now,
          },
          conflictAlgorithm: ConflictAlgorithm.replace,
        );
      }
      await batch.commit(noResult: true);
    } catch (_) {
      // Seed loading fallback
    }
  }

  @override
  Future<List<Article>> getArticles({
    String? category,
    CefrLevel? level,
    String? searchQuery,
    int? limit,
  }) async {
    await _ensureSeeded();
    final db = await _dbManager.database;

    final whereClauses = <String>[];
    final whereArgs = <dynamic>[];

    if (category != null && category.isNotEmpty && category != 'All') {
      whereClauses.add('category = ?');
      whereArgs.add(category);
    }

    if (level != null) {
      whereClauses.add('cefr_level = ?');
      whereArgs.add(level.name);
    }

    if (searchQuery != null && searchQuery.trim().isNotEmpty) {
      whereClauses.add('(title LIKE ? OR description LIKE ? OR body LIKE ?)');
      final pattern = '%${searchQuery.trim()}%';
      whereArgs.addAll([pattern, pattern, pattern]);
    }

    final whereString = whereClauses.isNotEmpty ? whereClauses.join(' AND ') : null;

    final rows = await db.query(
      'cached_articles',
      where: whereString,
      whereArgs: whereArgs.isNotEmpty ? whereArgs : null,
      orderBy: 'published_at DESC, cached_at DESC',
      limit: limit,
    );

    return rows.map(_fromMap).toList();
  }

  @override
  Future<Article?> getArticleById(String id) async {
    await _ensureSeeded();
    final db = await _dbManager.database;

    final rows = await db.query(
      'cached_articles',
      where: 'id = ?',
      whereArgs: [id],
      limit: 1,
    );

    if (rows.isEmpty) return null;
    return _fromMap(rows.first);
  }

  @override
  Future<void> markArticleAsRead(String id) async {
    await _ensureSeeded();
    final db = await _dbManager.database;
    await db.update(
      'cached_articles',
      {'is_read': 1, 'is_new': 0},
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  @override
  Future<int> getCachedArticlesCount() async {
    await _ensureSeeded();
    final db = await _dbManager.database;
    return Sqflite.firstIntValue(
      await db.rawQuery('SELECT COUNT(*) FROM cached_articles'),
    ) ?? 0;
  }

  @override
  Future<void> refreshArticles({bool force = false}) async {
    await _ensureSeeded();
    final lastRefresh = await _settingsRepository.getLastArticlesRefresh();
    final now = DateTime.now().millisecondsSinceEpoch;
    final twelveHoursMs = 12 * 60 * 60 * 1000;

    if (!force && (now - lastRefresh < twelveHoursMs)) {
      return; // Refresh within threshold
    }

    List<Article> newArticles = [];

    // 1. Try remote official JSON feed first
    try {
      newArticles = await _remoteJsonSource.fetchArticles();
    } catch (_) {}

    // 2. If remote JSON returned empty or failed, fetch from live sources
    if (newArticles.isEmpty) {
      final rawArticles = <RawArticle>[];
      for (final source in _sources) {
        try {
          final fetched = await source.fetch();
          rawArticles.addAll(fetched);
        } catch (_) {}
      }
      newArticles = _pipeline.process(rawArticles);
    }

    // 3. Save new articles into database
    if (newArticles.isNotEmpty) {
      final db = await _dbManager.database;
      final batch = db.batch();

      for (final article in newArticles) {
        batch.insert(
          'cached_articles',
          {
            'id': article.id,
            'source_name': article.sourceName,
            'source_url': article.sourceUrl,
            'license': article.license,
            'author': article.author,
            'published_at': article.publishedAt?.millisecondsSinceEpoch ?? now,
            'category': article.category,
            'cefr_level': article.level.name,
            'title': article.title,
            'description': article.description,
            'body': article.content,
            'sentences_json': jsonEncode(article.sentenceList),
            'translations_ar_json': article.translationsAr != null ? jsonEncode(article.translationsAr) : null,
            'writing_prompt': article.writingPrompt,
            'reading_minutes': article.readingTimeMinutes,
            'vocab_count': article.newWordsCount,
            'is_new': 1,
            'is_read': 0,
            'cached_at': now,
          },
          conflictAlgorithm: ConflictAlgorithm.ignore,
        );
      }
      await batch.commit(noResult: true);

      // Keep max ~200 articles: delete oldest unread ones if total exceeds 200
      await _trimCache(db, maxCount: 200);
    }

    await _settingsRepository.setLastArticlesRefresh(now);
  }

  Future<void> _trimCache(Database db, {int maxCount = 200}) async {
    final count = Sqflite.firstIntValue(
      await db.rawQuery('SELECT COUNT(*) FROM cached_articles'),
    ) ?? 0;

    if (count > maxCount) {
      final excess = count - maxCount;
      await db.rawDelete('''
        DELETE FROM cached_articles WHERE id IN (
          SELECT id FROM cached_articles
          WHERE is_read = 0
          ORDER BY cached_at ASC
          LIMIT ?
        )
      ''', [excess]);
    }
  }

  Article _fromMap(Map<String, dynamic> map) {
    return Article.fromJson({
      'id': map['id'],
      'title': map['title'],
      'description': map['description'],
      'content': map['body'],
      'topic': map['category'],
      'level': map['cefr_level'],
      'readingTimeMinutes': map['reading_minutes'],
      'newWordsCount': map['vocab_count'],
      'sourceName': map['source_name'],
      'sourceUrl': map['source_url'],
      'license': map['license'],
      'author': map['author'],
      'publishedAt': map['published_at'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['published_at'] as int).toIso8601String()
          : null,
      'sentences': map['sentences_json'],
      'translationsAr': map['translations_ar_json'],
      'writingPrompt': map['writing_prompt'],
      'isNew': (map['is_new'] as int? ?? 0) == 1,
    });
  }
}

class MockArticleRepository implements ArticleRepository {
  final List<Article> _articles;

  MockArticleRepository({List<Article>? articles}) : _articles = articles ?? [];

  @override
  Future<List<Article>> getArticles({
    String? category,
    CefrLevel? level,
    String? searchQuery,
    int? limit,
  }) async {
    var result = List<Article>.from(_articles);

    if (category != null && category.isNotEmpty && category != 'All') {
      result = result.where((a) => a.category.toLowerCase() == category.toLowerCase()).toList();
    }

    if (level != null) {
      result = result.where((a) => a.level == level).toList();
    }

    if (searchQuery != null && searchQuery.trim().isNotEmpty) {
      final query = searchQuery.toLowerCase().trim();
      result = result.where((a) =>
        a.title.toLowerCase().contains(query) ||
        a.description.toLowerCase().contains(query) ||
        a.content.toLowerCase().contains(query)
      ).toList();
    }

    if (limit != null && limit < result.length) {
      result = result.sublist(0, limit);
    }

    return result;
  }

  @override
  Future<Article?> getArticleById(String id) async {
    return _articles.where((a) => a.id == id).firstOrNull;
  }

  @override
  Future<void> markArticleAsRead(String id) async {}

  @override
  Future<int> getCachedArticlesCount() async => _articles.length;

  @override
  Future<void> refreshArticles({bool force = false}) async {}
}
