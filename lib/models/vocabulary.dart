class VocabularyWord {
  final String id;
  final String word;
  final String ipa;
  final String meaning;
  final String translation;
  final String exampleSentence;
  final String? audioUrl;
  final bool isLearned;
  final bool isSaved;

  // Aliases for screens that use different field names
  String get phonetic => ipa;
  String get definition => meaning;
  String get arabicTranslation => translation;

  const VocabularyWord({
    this.id = '',
    required this.word,
    required this.ipa,
    required this.meaning,
    String? translation,
    String? arabicTranslation,
    required this.exampleSentence,
    this.audioUrl,
    this.isLearned = false,
    this.isSaved = false,
  }) : translation = translation ?? arabicTranslation ?? '';

  VocabularyWord copyWith({
    String? id,
    String? word,
    String? ipa,
    String? meaning,
    String? translation,
    String? exampleSentence,
    String? audioUrl,
    bool? isLearned,
    bool? isSaved,
  }) {
    return VocabularyWord(
      id: id ?? this.id,
      word: word ?? this.word,
      ipa: ipa ?? this.ipa,
      meaning: meaning ?? this.meaning,
      translation: translation ?? this.translation,
      exampleSentence: exampleSentence ?? this.exampleSentence,
      audioUrl: audioUrl ?? this.audioUrl,
      isLearned: isLearned ?? this.isLearned,
      isSaved: isSaved ?? this.isSaved,
    );
  }
}
