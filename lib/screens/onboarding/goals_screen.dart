import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:fluento/providers/app_state.dart';

class GoalsScreen extends StatefulWidget {
  final VoidCallback onNext;

  const GoalsScreen({super.key, required this.onNext});

  @override
  State<GoalsScreen> createState() => _GoalsScreenState();
}

class _GoalsScreenState extends State<GoalsScreen> {
  final List<Map<String, String>> _goalOptions = [
    {'emoji': '🗣️', 'label': 'Speaking'},
    {'emoji': '🎯', 'label': 'Pronunciation'},
    {'emoji': '💬', 'label': 'Fluency'},
    {'emoji': '📝', 'label': 'Vocabulary'},
    {'emoji': '✍️', 'label': 'Writing'},
    {'emoji': '🌟', 'label': 'Overall English'},
  ];

  final Set<String> _selectedGoals = {};

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 16),
          Text(
            'What do you want to improve?',
            style: GoogleFonts.fraunces(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF1B1B1B),
            ),
          ),
          const SizedBox(height: 24),
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 1.1, // Adjusted for better text layout
              ),
              itemCount: _goalOptions.length,
              itemBuilder: (context, index) {
                final option = _goalOptions[index];
                final isSelected = _selectedGoals.contains(option['label']);

                return InkWell(
                  onTap: () {
                    setState(() {
                      if (isSelected) {
                        _selectedGoals.remove(option['label']);
                      } else {
                        _selectedGoals.add(option['label']!);
                      }
                    });
                  },
                  borderRadius: BorderRadius.circular(16),
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: isSelected
                          ? const Color(0xFF2D6A4F)
                          : Colors.white,
                      border: Border.all(
                        color: isSelected
                            ? const Color(0xFF2D6A4F)
                            : Colors.transparent,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        if (!isSelected)
                          BoxShadow(
                            color: Colors.black.withOpacity(0.05),
                            blurRadius: 10,
                            offset: const Offset(0, 4),
                          )
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          option['emoji']!,
                          style: const TextStyle(fontSize: 32),
                        ),
                        const SizedBox(height: 12),
                        Text(
                          option['label']!,
                          textAlign: TextAlign.center,
                          style: GoogleFonts.figtree(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: isSelected ? Colors.white : const Color(0xFF1B1B1B),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            height: 56,
            child: ElevatedButton(
              onPressed: _selectedGoals.isEmpty
                  ? null
                  : () {
                      final appState = context.read<AppState>();
                      appState.setGoals(_selectedGoals.toList());
                      appState.completeOnboarding();
                      widget.onNext();
                    },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF2D6A4F),
                disabledBackgroundColor: const Color(0xFF2D6A4F).withOpacity(0.5),
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 0,
              ),
              child: Text(
                'Start Learning',
                style: GoogleFonts.figtree(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}
