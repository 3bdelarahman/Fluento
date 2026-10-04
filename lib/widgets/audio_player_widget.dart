import 'package:flutter/material.dart';

class AudioPlayerWidget extends StatelessWidget {
  final bool isPlaying;
  final VoidCallback onPlay;

  const AudioPlayerWidget({
    super.key,
    required this.isPlaying,
    required this.onPlay,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text(
          'Listen to Natural English',
          style: TextStyle(
            fontFamily: 'Figtree',
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Color(0xFF1B1B1B),
          ),
        ),
        const SizedBox(height: 16),
        InkWell(
          onTap: onPlay,
          customBorder: const CircleBorder(),
          child: Container(
            width: 64,
            height: 64,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: const Color(0xFF2D6A4F),
                width: 2,
              ),
              color: const Color(0xFFFDF8F0),
            ),
            child: Icon(
              isPlaying ? Icons.pause_rounded : Icons.play_arrow_rounded,
              color: const Color(0xFF2D6A4F),
              size: 36,
            ),
          ),
        ),
      ],
    );
  }
}
