import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:fluento/models/cefr_level.dart';
import 'package:fluento/providers/app_state.dart';
import 'package:fluento/theme/app_colors.dart';
import 'package:fluento/widgets/article_card.dart';
import 'package:fluento/widgets/level_badge.dart';
import 'package:fluento/widgets/stat_card.dart';
import 'package:fluento/data/sample_articles.dart';
import 'package:fluento/screens/articles/article_reader_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final appState = context.watch<AppState>();
    final userProfile = appState.userProfile;
    final currentLevel = appState.currentLevel;

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Greeting
              Text(
                'Good morning, ${userProfile.name}',
                style: GoogleFonts.fraunces(
                  fontSize: 28,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textPrimary,
                ),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  LevelBadge(level: currentLevel),
                  const SizedBox(width: 8),
                  Text(
                    '${currentLevel.label} — ${currentLevel.title}',
                    style: GoogleFonts.figtree(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: AppColors.textSecondary,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 32),

              // Progress Card
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: AppColors.surface,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.05),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Your English Progress',
                      style: GoogleFonts.fraunces(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    const SizedBox(height: 16),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          StatCard(
                            label: 'Articles',
                            value: '${userProfile.articlesCompleted}',
                            icon: Icons.menu_book,
                            accentColor: AppColors.primary,
                          ),
                          const SizedBox(width: 12),
                          StatCard(
                            label: 'Reading',
                            value: '${userProfile.readingMinutes}m',
                            icon: Icons.timer,
                            accentColor: AppColors.accent,
                          ),
                          const SizedBox(width: 12),
                          StatCard(
                            label: 'Accuracy',
                            value: '${(userProfile.pronunciationAccuracy * 100).round()}%',
                            icon: Icons.mic,
                            accentColor: AppColors.primary,
                          ),
                          const SizedBox(width: 12),
                          StatCard(
                            label: 'Words',
                            value: '${userProfile.wordsLearned}',
                            icon: Icons.abc,
                            accentColor: AppColors.accent,
                          ),
                          const SizedBox(width: 12),
                          StatCard(
                            label: 'Writing',
                            value: '${userProfile.writingTasksCompleted}',
                            icon: Icons.edit,
                            accentColor: AppColors.primary,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),

              // Main CTA
              SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  onPressed: () {
                    if (sampleArticles.isNotEmpty) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => ArticleReaderScreen(article: sampleArticles.first),
                        ),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Continue Reading',
                        style: GoogleFonts.figtree(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(width: 8),
                      const Icon(Icons.arrow_forward),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 32),

              // Recommended Section
              Text(
                'Recommended for You',
                style: GoogleFonts.fraunces(
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textPrimary,
                ),
              ),
              const SizedBox(height: 16),
              ...sampleArticles.take(3).map((article) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: ArticleCard(
                    article: article,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => ArticleReaderScreen(article: article),
                        ),
                      );
                    },
                  ),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
