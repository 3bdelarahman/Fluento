import 'package:flutter/material.dart';
import 'package:fluento/models/vocabulary.dart';
import 'package:fluento/data/sample_vocabulary.dart';
import 'package:fluento/repositories/vocabulary_repository.dart';

class VocabularyProvider extends ChangeNotifier {
  final VocabularyRepository _repository;

  bool _isInitialized = false;
  List<VocabularyWord> _words = [];

  VocabularyProvider({VocabularyRepository? repository})
      : _repository = repository ?? SqliteVocabularyRepository();

  bool get isInitialized => _isInitialized;
  List<VocabularyWord> get vocabularyWords => List.unmodifiable(_words);

  List<VocabularyWord> get savedWords =>
      _words.where((w) => w.isSaved).toList();

  List<VocabularyWord> get learnedWords =>
      _words.where((w) => w.isLearned).toList();

  Future<void> init() async {
    if (_isInitialized) return;
    // Seed initial sample vocabulary if database is fresh
    await _repository.seedInitialWords(sampleVocabulary);
    _words = await _repository.getAllWords();
    if (_words.isEmpty) {
      _words = List.from(sampleVocabulary);
    }
    _isInitialized = true;
    notifyListeners();
  }

  Future<void> toggleSaved(int index) async {
    if (index >= 0 && index < _words.length) {
      final word = _words[index];
      final newSaved = !word.isSaved;
      _words[index] = word.copyWith(isSaved: newSaved);
      notifyListeners();
      await _repository.toggleSaved(word.id.isNotEmpty ? word.id : word.word, newSaved);
    }
  }

  Future<void> toggleLearned(int index) async {
    if (index >= 0 && index < _words.length) {
      final word = _words[index];
      final newLearned = !word.isLearned;
      _words[index] = word.copyWith(isLearned: newLearned);
      notifyListeners();
      await _repository.toggleLearned(word.id.isNotEmpty ? word.id : word.word, newLearned);
    }
  }

  Future<void> addWord(VocabularyWord word) async {
    final index = _words.indexWhere((w) => w.word.toLowerCase() == word.word.toLowerCase());
    if (index != -1) {
      _words[index] = word;
    } else {
      _words.insert(0, word);
    }
    notifyListeners();
    await _repository.upsertWord(word);
  }
}
