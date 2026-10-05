import 'dart:io';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluento/models/article.dart';
import 'package:fluento/models/cefr_level.dart';
import 'package:fluento/services/article_sources/article_source.dart';
import 'package:fluento/services/article_pipeline/sentence_splitter.dart';
import 'package:fluento/services/article_pipeline/text_cleaner.dart';
import 'package:fluento/services/article_pipeline/cefr_estimator.dart';
import 'package:fluento/services/article_pipeline/article_pipeline.dart';
import 'package:fluento/repositories/article_repository.dart';

void main() {
  group('Phase 2 — Article Pipeline & Source Tests', () {
    test('SentenceSplitter handles abbreviations, decimals, and quotes correctly', () {
      const text =
          'Dr. Watson visited the laboratory at approx. 3.14 miles away. '
          'He asked, "Is the system functioning properly?" '
          'Mr. Smith replied that everything was ready. For e.g. tests were green!';

      final sentences = SentenceSplitter.split(text);

      expect(sentences.length, greaterThanOrEqualTo(3));
      // First sentence should not split at Dr. or approx. or 3.14
      expect(sentences.first, contains('Dr. Watson visited the laboratory at approx. 3.14 miles away.'));
      // Quoted sentence preserved
      expect(sentences.any((s) => s.contains('"Is the system functioning properly?"')), isTrue);
    });

    test('TextCleaner cleans HTML, scripts, tags and decodes entities', () {
      final html = File('test/fixtures/sample_article.html').readAsStringSync();
      final cleaned = TextCleaner.cleanHtml(html);

      // Should not contain scripts, styles, or tags
      expect(cleaned.contains('<script>'), isFalse);
      expect(cleaned.contains('analytics tracking code'), isFalse);
      expect(cleaned.contains('<style>'), isFalse);
      expect(cleaned.contains('<header>'), isFalse);
      expect(cleaned.contains('<footer>'), isFalse);

      // Should decode entities
      expect(cleaned.contains('"clean power"'), isTrue);
      expect(cleaned.contains('&amp;'), isFalse);
      expect(cleaned.contains('&quot;'), isFalse);

      expect(TextCleaner.countWords(cleaned), greaterThan(15));
    });

    test('TextCleaner computes deterministic deduplication hash', () {
      final hash1 = TextCleaner.computeDedupeHash('https://example.com/ai', 'Future of AI');
      final hash2 = TextCleaner.computeDedupeHash('https://example.com/ai', 'Future of AI');
      final hash3 = TextCleaner.computeDedupeHash('https://example.com/solar', 'Future of AI');

      expect(hash1, equals(hash2));
      expect(hash1, isNot(equals(hash3)));
    });

    test('CefrEstimator differentiates beginner vs advanced texts and categorizes', () {
      final estimator = CefrEstimator();

      const beginnerText =
          'Tom walks to school. He has a red book. '
          'The school is near his house. His teacher is very kind. '
          'Tom likes to read and play with his friends.';
      final levelBeginner = estimator.estimate(beginnerText);
      expect(levelBeginner == CefrLevel.a1 || levelBeginner == CefrLevel.a2, isTrue);

      const advancedText =
          'The contemporary sociotechnical ecosystem exemplifies profound ontological fragility, '
          'wherein algorithmic curation paradigms inadvertently precipitate epistemic fragmentation '
          'and systemic erosion of institutional legitimacy across heterogeneous demographic cohorts.';
      final levelAdvanced = estimator.estimate(advancedText);
      expect(levelAdvanced == CefrLevel.b2 || levelAdvanced == CefrLevel.c1, isTrue);

      final techCategory = CefrEstimator.categorize('Artificial intelligence software and computer devices.');
      expect(techCategory, equals('Technology'));

      final healthCategory = CefrEstimator.categorize('Doctors advise healthy diet and hospital wellness.');
      expect(healthCategory, equals('Health'));
    });

    test('ArticlePipeline processes raw candidates and filters duplicates', () {
      final pipeline = ArticlePipeline(minWordCount: 15, maxWordCount: 500);

      final rawArticles = [
        const RawArticle(
          sourceId: 'voa',
          sourceName: 'VOA Learning English',
          sourceUrl: 'https://voa.example.com/1',
          license: 'Public Domain',
          author: 'VOA Editorial',
          rawTitle: 'Robots in Agriculture',
          rawContent:
              'Autonomous agricultural robots are transforming how fresh produce is harvested. '
              'Computer algorithms identify ripe strawberries with exceptional speed and precision. '
              'Farmers report significant productivity gains across commercial fields.',
        ),
        // Duplicate entry (same url and title)
        const RawArticle(
          sourceId: 'voa',
          sourceName: 'VOA Learning English',
          sourceUrl: 'https://voa.example.com/1',
          license: 'Public Domain',
          author: 'VOA Editorial',
          rawTitle: 'Robots in Agriculture',
          rawContent:
              'Autonomous agricultural robots are transforming how fresh produce is harvested. '
              'Computer algorithms identify ripe strawberries with exceptional speed and precision.',
        ),
      ];

      final processed = pipeline.process(rawArticles);

      expect(processed.length, equals(1));
      expect(processed.first.title, equals('Robots in Agriculture'));
      expect(processed.first.sentenceList.length, greaterThanOrEqualTo(2));
      expect(processed.first.license, equals('Public Domain'));
    });

    test('MockArticleRepository performs category and keyword filtering', () async {
      final repo = MockArticleRepository(articles: [
        const Article(
          id: 'art_1',
          title: 'Quantum Computing Innovations',
          description: 'Exploring quantum bits and gates',
          content: 'Quantum computing represents a major leap forward.',
          topic: 'Technology',
          imageEmoji: '💻',
          level: CefrLevel.b2,
          readingTimeMinutes: 5,
          newWordsCount: 10,
        ),
        const Article(
          id: 'art_2',
          title: 'Morning Yoga and Mindfulness',
          description: 'Simple morning routines for wellness',
          content: 'Daily stretching and breathing improves cardiovascular health.',
          topic: 'Health',
          imageEmoji: '🧘',
          level: CefrLevel.a2,
          readingTimeMinutes: 3,
          newWordsCount: 6,
        ),
      ]);

      final techOnly = await repo.getArticles(category: 'Technology');
      expect(techOnly.length, equals(1));
      expect(techOnly.first.title, contains('Quantum'));

      final searchResults = await repo.getArticles(searchQuery: 'yoga');
      expect(searchResults.length, equals(1));
      expect(searchResults.first.title, contains('Yoga'));

      final a2Only = await repo.getArticles(level: CefrLevel.a2);
      expect(a2Only.length, equals(1));
      expect(a2Only.first.id, equals('art_2'));
    });
  });
}
