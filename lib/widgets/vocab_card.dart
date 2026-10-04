import 'package:flutter/material.dart';

class VocabCard extends StatelessWidget {
  final String word;
  final String ipa;
  final String meaning;
  final String arabicTranslation;
  final bool isSaved;
  final VoidCallback onAudioTap;
  final VoidCallback onBookmarkTap;

  const VocabCard({
    super.key,
    required this.word,
    required this.ipa,
    required this.meaning,
    required this.arabicTranslation,
    required this.isSaved,
    required this.onAudioTap,
    required this.onBookmarkTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      shadowColor: Colors.black12,
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        word,
                        style: const TextStyle(
                          fontFamily: 'Fraunces',
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF1B1B1B),
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        ipa,
                        style: const TextStyle(
                          fontFamily: 'Figtree',
                          fontSize: 14,
                          color: Color(0xFF6B7280),
                        ),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  onPressed: onAudioTap,
                  icon: const Icon(Icons.volume_up_rounded),
                  color: const Color(0xFF2D6A4F),
                ),
                IconButton(
                  onPressed: onBookmarkTap,
                  icon: Icon(
                    isSaved ? Icons.bookmark_rounded : Icons.bookmark_border_rounded,
                  ),
                  color: isSaved ? const Color(0xFFE9B949) : const Color(0xFF6B7280),
                ),
              ],
            ),
            const Divider(height: 24, color: Color(0xFFFDF8F0)),
            Text(
              meaning,
              style: const TextStyle(
                fontFamily: 'Figtree',
                fontSize: 15,
                color: Color(0xFF1B1B1B),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              arabicTranslation,
              textDirection: TextDirection.rtl,
              style: const TextStyle(
                fontFamily: 'Figtree',
                fontSize: 15,
                color: Color(0xFF2D6A4F),
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
