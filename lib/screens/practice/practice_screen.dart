import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:fluento/models/pronunciation_feedback.dart';
import 'package:fluento/theme/app_colors.dart';
import 'package:fluento/models/cefr_level.dart';
import 'package:fluento/providers/app_state.dart';
import 'package:fluento/widgets/pronunciation_card.dart';
import 'package:fluento/data/sample_feedback.dart';
import 'package:fluento/data/sample_writing.dart';
import 'package:fluento/screens/practice/weak_point_detail_screen.dart';
import 'package:fluento/screens/writing/writing_prompt_screen.dart';

class PracticeScreen extends StatelessWidget {
  const PracticeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final appState = context.watch<AppState>();
    final currentLevel = appState.currentLevel;
    final List<PronunciationPoint> points = getWeakPointsForLevel(currentLevel);

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Practice',
                style: GoogleFonts.fraunces(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textPrimary,
                ),
              ),
              const SizedBox(height: 24),
              Text(
                'Recent Pronunciation Points',
                style: GoogleFonts.figtree(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textPrimary,
                ),
              ),
              const SizedBox(height: 12),
              ...points.asMap().entries.map((entry) {
                final index = entry.key;
                final point = entry.value;
                return Padding(
                  padding: const EdgeInsets.only(bottom: 12.0),
                  child: PronunciationCard(
                    type: _mapType(point.type),
                    title: point.title,
                    description: point.description,
                    focusWord: point.focusWord,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => WeakPointDetailScreen(
                            point: point,
                            allPoints: points,
                            currentIndex: index,
                          ),
                        ),
                      );
                    },
                  ),
                );
              }),
              const SizedBox(height: 32),
              Text(
                'Writing Practice',
                style: GoogleFonts.figtree(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textPrimary,
                ),
              ),
              const SizedBox(height: 12),
              ...sampleWritingTasks.map((task) {
                return Card(
                  color: AppColors.surface,
                  elevation: 1,
                  margin: const EdgeInsets.only(bottom: 12.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  child: ListTile(
                    contentPadding: const EdgeInsets.all(16.0),
                    title: Text(
                      task.articleTitle,
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    subtitle: Text(
                      'Target: ${task.minWords}–${task.maxWords} words',
                      style: const TextStyle(
                        color: AppColors.textSecondary,
                      ),
                    ),
                    trailing: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: AppColors.primary.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        task.level.label,
                        style: const TextStyle(
                          color: AppColors.primary,
                          fontWeight: FontWeight.w600,
                          fontSize: 12,
                        ),
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => WritingPromptScreen(task: task),
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

  PronunciationType _mapType(String type) {
    switch (type) {
      case 'word_stress':
        return PronunciationType.stress;
      case 'th_sound':
        return PronunciationType.sound;
      case 'linking':
        return PronunciationType.linking;
      default:
        return PronunciationType.intonation;
    }
  }
}
