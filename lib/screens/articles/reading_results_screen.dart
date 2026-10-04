import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:fluento/models/article.dart';
import 'package:fluento/theme/app_colors.dart';
import 'package:fluento/data/sample_feedback.dart';
import 'package:fluento/providers/app_state.dart';
import 'package:fluento/widgets/pronunciation_card.dart';
import 'package:fluento/widgets/feedback_bubble.dart';
import 'package:fluento/widgets/stat_card.dart';
import 'package:fluento/screens/practice/weak_point_detail_screen.dart';
import 'package:fluento/screens/writing/writing_prompt_screen.dart';

class ReadingResultsScreen extends StatelessWidget {
  final Article article;

  const ReadingResultsScreen({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    final appState = context.watch<AppState>();
    final currentLevel = appState.currentLevel;
    
    // Using sample data
    final result = sampleReadingResult;
    final weakPoints = getWeakPointsForLevel(samplePronunciationPoints, currentLevel);

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('Results'),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () => Navigator.popUntil(context, (route) => route.isFirst),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Your Reading Results',
              style: TextStyle(
                fontFamily: 'Fraunces',
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimary,
              ),
            ),
            const SizedBox(height: 32),
            Center(
              child: CircularPercentIndicator(
                radius: 80.0,
                lineWidth: 12.0,
                percent: result.overallScore,
                center: Text(
                  '${(result.overallScore * 100).round()}%',
                  style: const TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textPrimary,
                  ),
                ),
                progressColor: AppColors.success,
                backgroundColor: AppColors.surface,
                circularStrokeCap: CircularStrokeCap.round,
              ),
            ),
            const SizedBox(height: 16),
            const Center(
              child: Text(
                'Good job!',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textPrimary,
                ),
              ),
            ),
            const SizedBox(height: 32),
            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              mainAxisSpacing: 16,
              crossAxisSpacing: 16,
              childAspectRatio: 1.5,
              children: [
                StatCard(
                  title: 'Reading Accuracy',
                  value: '${(result.readingAccuracy * 100).round()}%',
                  icon: Icons.check_circle_outline,
                  color: AppColors.success,
                ),
                StatCard(
                  title: 'Pronunciation',
                  value: '${(result.pronunciationScore * 100).round()}%',
                  icon: Icons.record_voice_over_outlined,
                  color: AppColors.accent,
                ),
                StatCard(
                  title: 'Fluency',
                  value: '${(result.fluencyScore * 100).round()}%',
                  icon: Icons.water_drop_outlined,
                  color: Colors.blue,
                ),
                StatCard(
                  title: 'Speaking Speed',
                  value: '${result.wordsPerMinute} WPM',
                  icon: Icons.speed,
                  color: Colors.purple,
                ),
                StatCard(
                  title: 'Words Read',
                  value: '${result.wordsRead}',
                  icon: Icons.menu_book,
                  color: Colors.orange,
                ),
              ],
            ),
            const SizedBox(height: 32),
            const FeedbackBubble(
              text: 'You did well overall. Here are the pronunciation points that would help you improve.',
            ),
            const SizedBox(height: 32),
            Text(
              '${weakPoints.length} pronunciation points to improve',
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimary,
              ),
            ),
            const SizedBox(height: 16),
            ...weakPoints.map((point) => Padding(
              padding: const EdgeInsets.only(bottom: 12.0),
              child: PronunciationCard(
                weakPoint: point,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => WeakPointDetailScreen(weakPoint: point),
                    ),
                  );
                },
              ),
            )),
            const SizedBox(height: 32),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  if (weakPoints.isNotEmpty) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => WeakPointDetailScreen(weakPoint: weakPoints.first),
                      ),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.success,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text('Practice Pronunciation'),
              ),
            ),
            const SizedBox(height: 12),
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const WritingPromptScreen(),
                    ),
                  );
                },
                style: OutlinedButton.styleFrom(
                  foregroundColor: AppColors.primary,
                  side: const BorderSide(color: AppColors.primary),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text('Practice Writing'),
              ),
            ),
            const SizedBox(height: 12),
            SizedBox(
              width: double.infinity,
              child: TextButton(
                onPressed: () {
                  Navigator.popUntil(context, (route) => route.isFirst);
                },
                style: TextButton.styleFrom(
                  foregroundColor: AppColors.textSecondary,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                child: const Text('Back to Home'),
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
