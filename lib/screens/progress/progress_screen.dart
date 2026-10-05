import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:fluento/models/cefr_level.dart';
import 'package:fluento/theme/app_colors.dart';
import 'package:fluento/providers/app_state.dart';
import 'package:fluento/screens/progress/ai_level_screen.dart';

class ProgressScreen extends StatelessWidget {
  const ProgressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final appState = context.watch<AppState>();
    final user = appState.userProfile;

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text(
          'Your Progress',
          style: GoogleFonts.fraunces(
            color: AppColors.textPrimary,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: AppColors.background,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Current Level Card
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [AppColors.primary, Color(0xFF1B4332)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                children: [
                  Container(
                    width: 80,
                    height: 80,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      user.level.name.toUpperCase(),
                      style: GoogleFonts.fraunces(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primary,
                      ),
                    ),
                  ),
                  const SizedBox(width: 24),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Current Level',
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.8),
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          user.level.index < CefrLevel.values.length - 1
                              ? 'Progress toward ${CefrLevel.values[user.level.index + 1].name.toUpperCase()}'
                              : 'Mastery Level Achieved',
                          style: GoogleFonts.fraunces(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 12),
                        LinearPercentIndicator(
                          padding: EdgeInsets.zero,
                          lineHeight: 8.0,
                          percent: ((user.articlesCompleted % 10) / 10.0).clamp(0.1, 1.0),
                          backgroundColor: Colors.white.withValues(alpha: 0.2),
                          progressColor: AppColors.accent,
                          barRadius: const Radius.circular(4),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),
            
            // Skills breakdown
            Text(
              'Skills Breakdown',
              style: GoogleFonts.fraunces(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimary,
              ),
            ),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: AppColors.surface,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                children: [
                  _buildSkillBar('Reading', (user.articlesCompleted > 0 ? (user.articlesCompleted / 15.0).clamp(0.05, 1.0) : 0.0)),
                  const SizedBox(height: 12),
                  _buildSkillBar('Pronunciation', user.pronunciationAccuracy.clamp(0.0, 1.0)),
                  const SizedBox(height: 12),
                  _buildSkillBar('Fluency', (user.readingMinutes > 0 ? (user.readingMinutes / 120.0).clamp(0.05, 1.0) : 0.0)),
                  const SizedBox(height: 12),
                  _buildSkillBar('Vocabulary', (user.wordsLearned > 0 ? (user.wordsLearned / 100.0).clamp(0.05, 1.0) : 0.0)),
                  const SizedBox(height: 12),
                  _buildSkillBar('Writing', (user.writingTasksCompleted > 0 ? (user.writingTasksCompleted / 10.0).clamp(0.05, 1.0) : 0.0)),
                ],
              ),
            ),
            const SizedBox(height: 32),

            // AI Feedback Level Card
            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const AILevelScreen()));
              },
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: AppColors.surface,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: AppColors.primary.withOpacity(0.3), width: 2),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.auto_awesome, color: AppColors.accent, size: 32),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Your AI Feedback Level',
                            style: GoogleFonts.fraunces(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: AppColors.textPrimary,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            'Level: ${user.level.name.toUpperCase()} • Tap to change',
                            style: const TextStyle(
                              color: AppColors.textSecondary,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Icon(Icons.arrow_forward_ios, color: AppColors.textSecondary, size: 16),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 32),

            // This Week
            Text(
              'This Week',
              style: GoogleFonts.fraunces(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimary,
              ),
            ),
            const SizedBox(height: 16),
            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              mainAxisSpacing: 16,
              crossAxisSpacing: 16,
              childAspectRatio: 1.5,
              children: [
                _buildStatCard('Articles', '${user.articlesCompleted}', Icons.article),
                _buildStatCard('Reading Time', '${user.readingMinutes}m', Icons.timer),
                _buildStatCard('New Words', '${user.wordsLearned}', Icons.menu_book),
                _buildStatCard('Pronunciation', '${(user.pronunciationAccuracy * 100).round()}%', Icons.record_voice_over),
                _buildStatCard('Writing Tasks', '${user.writingTasksCompleted}', Icons.edit),
              ],
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _buildSkillBar(String title, double percent) {
    return Row(
      children: [
        SizedBox(
          width: 100,
          child: Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.w600, color: AppColors.textPrimary),
          ),
        ),
        Expanded(
          child: LinearPercentIndicator(
            padding: EdgeInsets.zero,
            lineHeight: 10.0,
            percent: percent,
            backgroundColor: AppColors.background,
            progressColor: AppColors.primary,
            barRadius: const Radius.circular(5),
          ),
        ),
        const SizedBox(width: 12),
        SizedBox(
          width: 40,
          child: Text(
            '${(percent * 100).toInt()}%',
            style: const TextStyle(color: AppColors.textSecondary, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }

  Widget _buildStatCard(String title, String value, IconData icon) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: AppColors.primary, size: 24),
          const Spacer(),
          Text(
            value,
            style: GoogleFonts.fraunces(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: AppColors.textPrimary,
            ),
          ),
          Text(
            title,
            style: const TextStyle(
              fontSize: 12,
              color: AppColors.textSecondary,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
