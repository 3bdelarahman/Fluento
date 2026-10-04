import 'package:fluento/models/cefr_level.dart';
import 'package:fluento/models/pronunciation_feedback.dart';

final ReadingResult sampleReadingResult = ReadingResult(
  overallScore: 0.86,
  readingAccuracy: 0.92,
  pronunciationScore: 0.84,
  fluencyScore: 0.81,
  speakingSpeedWpm: 128,
  wordsRead: 742,
  encouragement: 'You did well overall. Here are the pronunciation points that would help you improve.',
);

final List<PronunciationPoint> samplePronunciationPoints = [
  const PronunciationPoint(
    id: 'p1',
    word: 'development',
    focusWord: 'development',
    sentence: 'However, the rapid development of AI also brings some concerns.',
    arabicTranslation: 'تطور الذكاء الاصطناعي السريع بيجيب كمان بعض المخاوف.',
    explanation: 'Pay attention to the word stress. In "development", the stress is on the second syllable: de-VEL-op-ment.',
    minLevel: CefrLevel.a2,
  ),
  const PronunciationPoint(
    id: 'p2',
    word: 'through',
    focusWord: 'through',
    sentence: 'One of the most common ways we interact with AI is through our smartphones.',
    arabicTranslation: 'واحدة من أكتر الطرق اللي بنتفاعل بيها مع الذكاء الاصطناعي هي من خلال موبايلاتنا.',
    explanation: 'Make sure to pronounce the /θ/ sound clearly by placing your tongue between your teeth, rather than using an /s/ or /z/ sound.',
    minLevel: CefrLevel.a1,
  ),
  const PronunciationPoint(
    id: 'p3',
    word: 'is_everywhere',
    focusWord: 'is everywhere',
    sentence: 'You might not always notice it, but AI is everywhere around you.',
    arabicTranslation: 'ممكن مش دايماً تاخد بالك، بس الذكاء الاصطناعي في كل مكان حواليك.',
    explanation: 'Practice sentence linking. When a word ends with a consonant sound and the next begins with a vowel, link them smoothly: "is everywhere" -> "iz-everywhere".',
    minLevel: CefrLevel.b1,
  ),
  const PronunciationPoint(
    id: 'p4',
    word: 'going to',
    focusWord: 'going to',
    sentence: 'AI is working in the background to make our lives easier.',
    arabicTranslation: 'الذكاء الاصطناعي شغال في الخلفية عشان يخلي حياتنا أسهل.',
    explanation: 'Notice how native speakers often reduce functional words. "to make" sounds more like "tuh make" in natural fast speech.',
    minLevel: CefrLevel.b2,
  ),
  const PronunciationPoint(
    id: 'p5',
    word: 'intonation',
    focusWord: 'Despite these challenges,',
    sentence: 'Despite these challenges, AI will continue to develop and shape the future.',
    arabicTranslation: 'بالرغم من التحديات دي، الذكاء الاصطناعي هيستمر يتطور ويشكل المستقبل.',
    explanation: 'Focus on your intonation. Your voice should rise slightly at the comma after "challenges" to indicate the sentence is not finished yet, then fall at the end.',
    minLevel: CefrLevel.c1,
  ),
];

// Handles both getWeakPointsForLevel(level) and getWeakPointsForLevel(points, level)
List<PronunciationPoint> getWeakPointsForLevel(dynamic first, [CefrLevel? second]) {
  CefrLevel targetLevel;
  List<PronunciationPoint> list;
  if (first is CefrLevel) {
    targetLevel = first;
    list = samplePronunciationPoints;
  } else if (first is List<PronunciationPoint>) {
    list = first;
    targetLevel = second ?? CefrLevel.b1;
  } else {
    targetLevel = CefrLevel.b1;
    list = samplePronunciationPoints;
  }
  return list.where((point) => point.minLevel.index <= targetLevel.index).toList();
}
