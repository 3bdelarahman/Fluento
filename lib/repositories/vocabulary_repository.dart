import 'package:sqflite/sqflite.dart';
import 'package:fluento/database/app_database.dart';
import 'package:fluento/models/vocabulary.dart';

abstract class VocabularyRepository {
  Future<List<VocabularyWord>> getAllWords();
  Future<void> upsertWord(VocabularyWord word);
  Future<void> toggleSaved(String wordId, bool isSaved);
  Future<void> toggleLearned(String wordId, bool isLearned);
  Future<void> seedInitialWords(List<VocabularyWord> words);
}

class SqliteVocabularyRepository implements VocabularyRepository {
  final AppDatabase _dbManager;

  SqliteVocabularyRepository({AppDatabase? dbManager})
      : _dbManager = dbManager ?? AppDatabase();

  @override
  Future<List<VocabularyWord>> getAllWords() async {
    final db = await _dbManager.database;
    final List<Map<String, dynamic>> maps = await db.query(
      'vocabulary_words',
      orderBy: 'updated_at DESC',
    );

    return maps.map((map) {
      return VocabularyWord(
        id: map['id'] as String,
        word: map['word'] as String,
        ipa: map['ipa'] as String,
        meaning: map['meaning'] as String,
        translation: map['translation'] as String,
        exampleSentence: map['example_sentence'] as String,
        audioUrl: map['audio_url'] as String?,
        isLearned: (map['is_learned'] as int) == 1,
        isSaved: (map['is_saved'] as int) == 1,
      );
    }).toList();
  }

  @override
  Future<void> upsertWord(VocabularyWord word) async {
    final db = await _dbManager.database;
    await db.insert(
      'vocabulary_words',
      {
        'id': word.id.isNotEmpty ? word.id : word.word.toLowerCase(),
        'word': word.word,
        'ipa': word.ipa,
        'meaning': word.meaning,
        'translation': word.translation,
        'example_sentence': word.exampleSentence,
        'audio_url': word.audioUrl,
        'is_learned': word.isLearned ? 1 : 0,
        'is_saved': word.isSaved ? 1 : 0,
        'updated_at': DateTime.now().millisecondsSinceEpoch,
      },
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  @override
  Future<void> toggleSaved(String wordId, bool isSaved) async {
    final db = await _dbManager.database;
    await db.update(
      'vocabulary_words',
      {
        'is_saved': isSaved ? 1 : 0,
        'updated_at': DateTime.now().millisecondsSinceEpoch,
      },
      where: 'id = ? OR word = ?',
      whereArgs: [wordId, wordId],
    );
  }

  @override
  Future<void> toggleLearned(String wordId, bool isLearned) async {
    final db = await _dbManager.database;
    await db.update(
      'vocabulary_words',
      {
        'is_learned': isLearned ? 1 : 0,
        'updated_at': DateTime.now().millisecondsSinceEpoch,
      },
      where: 'id = ? OR word = ?',
      whereArgs: [wordId, wordId],
    );
  }

  @override
  Future<void> seedInitialWords(List<VocabularyWord> words) async {
    final db = await _dbManager.database;
    final count = Sqflite.firstIntValue(
      await db.rawQuery('SELECT COUNT(*) FROM vocabulary_words'),
    );

    if (count == null || count == 0) {
      final batch = db.batch();
      for (final word in words) {
        batch.insert(
          'vocabulary_words',
          {
            'id': word.id.isNotEmpty ? word.id : word.word.toLowerCase(),
            'word': word.word,
            'ipa': word.ipa,
            'meaning': word.meaning,
            'translation': word.translation,
            'example_sentence': word.exampleSentence,
            'audio_url': word.audioUrl,
            'is_learned': word.isLearned ? 1 : 0,
            'is_saved': word.isSaved ? 1 : 0,
            'updated_at': DateTime.now().millisecondsSinceEpoch,
          },
          conflictAlgorithm: ConflictAlgorithm.ignore,
        );
      }
      await batch.commit(noResult: true);
    }
  }
}

class MockVocabularyRepository implements VocabularyRepository {
  final List<VocabularyWord> _words;

  MockVocabularyRepository([List<VocabularyWord>? initialWords])
      : _words = initialWords != null ? List.from(initialWords) : [];

  @override
  Future<List<VocabularyWord>> getAllWords() async => List.from(_words);

  @override
  Future<void> upsertWord(VocabularyWord word) async {
    final index = _words.indexWhere((w) => w.id == word.id || w.word == word.word);
    if (index != -1) {
      _words[index] = word;
    } else {
      _words.add(word);
    }
  }

  @override
  Future<void> toggleSaved(String wordId, bool isSaved) async {
    final index = _words.indexWhere((w) => w.id == wordId || w.word == wordId);
    if (index != -1) {
      _words[index] = _words[index].copyWith(isSaved: isSaved);
    }
  }

  @override
  Future<void> toggleLearned(String wordId, bool isLearned) async {
    final index = _words.indexWhere((w) => w.id == wordId || w.word == wordId);
    if (index != -1) {
      _words[index] = _words[index].copyWith(isLearned: isLearned);
    }
  }

  @override
  Future<void> seedInitialWords(List<VocabularyWord> words) async {
    if (_words.isEmpty) {
      _words.addAll(words);
    }
  }
}
