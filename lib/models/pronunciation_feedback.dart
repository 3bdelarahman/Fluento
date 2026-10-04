import 'package:fluento/models/cefr_level.dart';

class PronunciationPoint {
  final String id;
  final String type;
  final String title;
  final String description;
  final String sentence;
  final String sentenceTranslation;
  final String focusWord;
  final String explanation;
  final String aiExplanation;
  final CefrLevel minLevel;

  const PronunciationPoint({
    required this.id,
    String? type,
    String? title,
    String? description,
    required this.sentence,
    String? sentenceTranslation,
    String? arabicTranslation,
    required this.focusWord,
    required this.explanation,
    String? aiExplanation,
    String? word,
    this.minLevel = CefrLevel.b1,
  })  : type = type ??
            (id == 'p1'
                ? 'word_stress'
                : id == 'p2'
                    ? 'th_sound'
                    : id == 'p3'
                        ? 'linking'
                        : id == 'p4'
                            ? 'reduction'
                            : 'intonation'),
        title = title ??
            (id == 'p1'
                ? 'Word Stress'
                : id == 'p2'
                    ? '/θ/ Sound'
                    : id == 'p3'
                        ? 'Sentence Linking'
                        : id == 'p4'
                            ? 'Reduction'
                            : 'Intonation'),
        description = description ??
            (id == 'p1'
                ? 'Stress the second syllable'
                : id == 'p2'
                    ? 'Pronounce /θ/ sound'
                    : id == 'p3'
                        ? 'Smooth connected speech'
                        : id == 'p4'
                            ? 'Natural speech reduction'
                            : 'Expressive intonation'),
        sentenceTranslation = sentenceTranslation ?? arabicTranslation ?? '',
        aiExplanation = aiExplanation ?? explanation;

  // Aliases for screens using different names
  String get fullSentence => sentence;
  String get arabicTranslation => sentenceTranslation;
  String get word => focusWord;

  bool get isStress => type == 'word_stress';
  bool get isSound => type.contains('sound');
  bool get isLinking => type == 'linking';
  bool get isReduction => type == 'reduction';
  bool get isIntonation => type == 'intonation';
  bool get isRhythm => type == 'rhythm';
}

class ReadingResult {
  final double overallScore;
  final double readingAccuracy;
  final double pronunciationScore;
  final double fluencyScore;
  final int speakingSpeedWpm;
  final int wordsRead;
  final List<PronunciationPoint> weakPoints;
  final String encouragement;

  double get accuracy => (readingAccuracy <= 1.0 ? readingAccuracy * 100 : readingAccuracy);
  int get wordsPerMinute => speakingSpeedWpm;

  const ReadingResult({
    required this.overallScore,
    required this.readingAccuracy,
    required this.pronunciationScore,
    required this.fluencyScore,
    required this.speakingSpeedWpm,
    required this.wordsRead,
    this.weakPoints = const [],
    required this.encouragement,
  });
}
