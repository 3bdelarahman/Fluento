import 'package:fluento/models/cefr_level.dart';
import 'package:fluento/services/article_pipeline/sentence_splitter.dart';
import 'package:fluento/services/article_pipeline/text_cleaner.dart';

class CefrEstimator {
  final Set<String> commonWords;

  CefrEstimator({Set<String>? commonWordsList})
      : commonWords = commonWordsList ?? _defaultCoreWords;

  /// Estimates CEFR level from article text, Flesch-Kincaid grade level,
  /// vocabulary frequency profile, and optional source-provided level hint.
  CefrLevel estimate(String text, {CefrLevel? sourceHint}) {
    if (sourceHint != null) {
      return sourceHint;
    }

    final sentences = SentenceSplitter.split(text);
    final totalWords = TextCleaner.countWords(text);
    if (totalWords < 20 || sentences.isEmpty) {
      return CefrLevel.b1; // Default fallback
    }

    // 1. Calculate syllables
    final words = text
        .toLowerCase()
        .replaceAll(RegExp(r'[^a-z\s]'), '')
        .split(RegExp(r'\s+'))
        .where((w) => w.isNotEmpty)
        .toList();

    int totalSyllables = 0;
    int uncommonWordsCount = 0;

    for (final word in words) {
      totalSyllables += _countSyllables(word);
      if (!commonWords.contains(word)) {
        uncommonWordsCount++;
      }
    }

    final avgSentenceLength = words.length / sentences.length;
    final avgSyllablesPerWord = words.isNotEmpty ? totalSyllables / words.length : 1.2;

    // Flesch-Kincaid Grade Level formula
    final fkgl = 0.39 * avgSentenceLength + 11.8 * avgSyllablesPerWord - 15.59;
    final uncommonRatio = words.isNotEmpty ? uncommonWordsCount / words.length : 0.15;

    // Weighted combined difficulty score (Grade level + vocabulary richness)
    final difficulty = fkgl * 0.75 + (uncommonRatio * 15.0) * 0.25;

    if (difficulty <= 4.0) {
      return CefrLevel.a1;
    } else if (difficulty <= 6.5) {
      return CefrLevel.a2;
    } else if (difficulty <= 9.5) {
      return CefrLevel.b1;
    } else if (difficulty <= 13.0) {
      return CefrLevel.b2;
    } else {
      return CefrLevel.c1;
    }
  }

  /// Estimates topic/category from content and tags
  static String categorize(String text, {String? categoryHint}) {
    if (categoryHint != null && categoryHint.isNotEmpty) {
      final hintLower = categoryHint.toLowerCase();
      if (hintLower.contains('tech') || hintLower.contains('ai') || hintLower.contains('comput') || hintLower.contains('digital')) {
        return 'Technology';
      }
      if (hintLower.contains('sci') || hintLower.contains('space') || hintLower.contains('physics') || hintLower.contains('nature')) {
        return 'Science';
      }
      if (hintLower.contains('busin') || hintLower.contains('econ') || hintLower.contains('financ') || hintLower.contains('market')) {
        return 'Business';
      }
      if (hintLower.contains('health') || hintLower.contains('medic') || hintLower.contains('well') || hintLower.contains('diet')) {
        return 'Health';
      }
      if (hintLower.contains('travel') || hintLower.contains('tour') || hintLower.contains('city') || hintLower.contains('place')) {
        return 'Travel';
      }
      if (hintLower.contains('env') || hintLower.contains('climat') || hintLower.contains('earth') || hintLower.contains('green')) {
        return 'Environment';
      }
      if (hintLower.contains('cultur') || hintLower.contains('art') || hintLower.contains('music') || hintLower.contains('histor')) {
        return 'Culture';
      }
      if (hintLower.contains('soci') || hintLower.contains('communit') || hintLower.contains('peopl')) {
        return 'Society';
      }
    }

    final lower = text.toLowerCase();
    final scores = <String, int>{
      'Technology': _keywordHits(lower, ['technology', 'software', 'internet', 'digital', 'ai', 'computer', 'device', 'smartphone', 'algorithm', 'app']),
      'Science': _keywordHits(lower, ['science', 'research', 'study', 'scientist', 'discovery', 'space', 'astronomy', 'biology', 'experiment', 'nasa']),
      'Business': _keywordHits(lower, ['business', 'company', 'market', 'economy', 'trade', 'finance', 'industry', 'invest', 'stock', 'consumer']),
      'Health': _keywordHits(lower, ['health', 'doctor', 'hospital', 'medical', 'disease', 'wellness', 'diet', 'exercise', 'nutrition', 'medicine']),
      'Environment': _keywordHits(lower, ['climate', 'environment', 'ocean', 'carbon', 'planet', 'forest', 'species', 'renewable', 'energy', 'wildlife']),
      'Travel': _keywordHits(lower, ['travel', 'tourism', 'destination', 'flight', 'journey', 'hotel', 'island', 'visit', 'explore', 'trip']),
      'Culture': _keywordHits(lower, ['culture', 'art', 'music', 'tradition', 'film', 'museum', 'history', 'literature', 'festival', 'language']),
      'Society': _keywordHits(lower, ['society', 'community', 'education', 'family', 'people', 'public', 'youth', 'social', 'civic', 'human']),
      'Daily Life': _keywordHits(lower, ['daily', 'routine', 'home', 'work', 'habit', 'sleep', 'morning', 'lifestyle', 'cooking', 'leisure']),
    };

    String topCategory = 'Daily Life';
    int maxHits = 0;
    scores.forEach((category, hits) {
      if (hits > maxHits) {
        maxHits = hits;
        topCategory = category;
      }
    });

    return topCategory;
  }

  static int _keywordHits(String text, List<String> keywords) {
    int count = 0;
    for (final kw in keywords) {
      if (text.contains(kw)) count++;
    }
    return count;
  }

  static int _countSyllables(String word) {
    if (word.length <= 3) return 1;
    final w = word.toLowerCase();
    int count = 0;
    bool prevIsVowel = false;
    const vowels = 'aeiouy';

    for (int i = 0; i < w.length; i++) {
      final isVowel = vowels.contains(w[i]);
      if (isVowel && !prevIsVowel) {
        count++;
      }
      prevIsVowel = isVowel;
    }

    if (w.endsWith('e') && !w.endsWith('le') && count > 1) {
      count--;
    }
    return count > 0 ? count : 1;
  }

  static const Set<String> _defaultCoreWords = {
    'the', 'be', 'to', 'of', 'and', 'a', 'in', 'that', 'have', 'i',
    'it', 'for', 'not', 'on', 'with', 'he', 'as', 'you', 'do', 'at',
    'this', 'but', 'his', 'by', 'from', 'they', 'we', 'say', 'her', 'she',
    'or', 'an', 'will', 'my', 'one', 'all', 'would', 'there', 'their', 'what',
    'so', 'up', 'out', 'if', 'about', 'who', 'get', 'which', 'go', 'me',
    'when', 'make', 'can', 'like', 'time', 'no', 'just', 'him', 'know', 'take',
    'people', 'into', 'year', 'your', 'good', 'some', 'could', 'them', 'see', 'other',
    'than', 'then', 'now', 'look', 'only', 'come', 'its', 'over', 'think', 'also',
    'back', 'after', 'use', 'two', 'how', 'our', 'work', 'first', 'well', 'way',
    'even', 'new', 'want', 'because', 'any', 'these', 'give', 'day', 'most', 'us',
    'is', 'are', 'was', 'were', 'been', 'has', 'had', 'did', 'does', 'am',
    'more', 'very', 'great', 'life', 'world', 'learn', 'read', 'speak', 'write', 'book',
  };
}
