import 'package:fluento/models/writing_task.dart';
import 'package:fluento/models/cefr_level.dart';

final List<WritingTask> sampleWritingTasks = [
  const WritingTask(
    id: 'w1',
    prompt: 'Write a short paragraph about how you use Artificial Intelligence in your daily life. Do you find it helpful or concerning?',
    articleTitle: 'Your experience with AI',
    minWords: 100,
    maxWords: 150,
    level: CefrLevel.b1,
  ),
  const WritingTask(
    id: 'w2',
    prompt: 'Based on the article, write about whether you would trust a self-driving car. Why or why not?',
    articleTitle: 'The Future of Transport',
    minWords: 120,
    maxWords: 180,
    level: CefrLevel.b2,
  ),
  const WritingTask(
    id: 'w3',
    prompt: 'Imagine a day without any internet connection or digital assistants. Describe what your day would look like.',
    articleTitle: 'A Day Without Internet',
    minWords: 80,
    maxWords: 120,
    level: CefrLevel.a2,
  ),
];

// Alias for practice screen compatibility
final List<WritingTask> sampleWritingPrompts = sampleWritingTasks;

final WritingFeedback sampleWritingFeedback = WritingFeedback(
  overall: 'Good job!',
  score: 0.78,
  corrections: const [
    WritingCorrection(
      category: 'Grammar',
      original: 'I uses my phone every day.',
      corrected: 'I use my phone every day.',
      explanation: 'Use the base form of the verb "use" with the subject "I".',
    ),
    WritingCorrection(
      category: 'Vocabulary',
      original: 'The AI is very good and fast.',
      corrected: 'The AI is incredibly efficient.',
      explanation: 'Using more advanced vocabulary like "incredibly efficient" makes your writing sound more natural and precise.',
    ),
    WritingCorrection(
      category: 'Spelling',
      original: 'It makes life esier.',
      corrected: 'It makes life easier.',
      explanation: 'Watch your spelling. "Easier" is spelled with an "a" before the "s".',
    ),
    WritingCorrection(
      category: 'Sentence Structure',
      original: 'I like AI, it helps me.',
      corrected: 'I like AI because it helps me.',
      explanation: 'Use a conjunction like "because" to connect these two related clauses and improve the sentence structure.',
    ),
  ],
);
