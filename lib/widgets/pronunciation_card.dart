import 'package:flutter/material.dart';
import 'package:fluento/models/pronunciation_feedback.dart';

enum PronunciationType { stress, sound, linking, intonation }

class PronunciationCard extends StatelessWidget {
  final PronunciationType? type;
  final String? title;
  final String? description;
  final String? focusWord;
  final VoidCallback onTap;
  final PronunciationPoint? weakPoint;
  final PronunciationPoint? point;

  const PronunciationCard({
    super.key,
    this.type,
    this.title,
    this.description,
    this.focusWord,
    required this.onTap,
    this.weakPoint,
    this.point,
  });

  PronunciationType _resolveType() {
    if (type != null) return type!;
    final p = weakPoint ?? point;
    if (p != null) {
      if (p.isStress) return PronunciationType.stress;
      if (p.isSound) return PronunciationType.sound;
      if (p.isLinking) return PronunciationType.linking;
      return PronunciationType.intonation;
    }
    return PronunciationType.stress;
  }

  IconData _getIcon(PronunciationType t) {
    switch (t) {
      case PronunciationType.stress:
        return Icons.volume_up_rounded;
      case PronunciationType.sound:
        return Icons.music_note_rounded;
      case PronunciationType.linking:
        return Icons.link_rounded;
      case PronunciationType.intonation:
        return Icons.trending_up_rounded;
    }
  }

  @override
  Widget build(BuildContext context) {
    final p = weakPoint ?? point;
    final resolvedType = _resolveType();
    final displayTitle = title ?? p?.title ?? 'Pronunciation Point';
    final displayDesc = description ?? p?.description ?? '';
    final displayFocus = focusWord ?? p?.focusWord ?? '';

    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(color: Colors.grey.shade200),
      ),
      color: Colors.white,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: const Color(0xFFFDF8F0),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  _getIcon(resolvedType),
                  color: const Color(0xFF2D6A4F),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      displayTitle,
                      style: const TextStyle(
                        fontFamily: 'Figtree',
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Color(0xFF1B1B1B),
                      ),
                    ),
                    const SizedBox(height: 4),
                    RichText(
                      text: TextSpan(
                        style: const TextStyle(
                          fontFamily: 'Figtree',
                          fontSize: 14,
                          color: Color(0xFF6B7280),
                        ),
                        children: [
                          TextSpan(text: '$displayDesc '),
                          if (displayFocus.isNotEmpty)
                            TextSpan(
                              text: displayFocus,
                              style: const TextStyle(
                                color: Color(0xFFE9B949),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const Icon(
                Icons.chevron_right_rounded,
                color: Color(0xFF6B7280),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
