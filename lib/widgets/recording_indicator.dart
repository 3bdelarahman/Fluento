import 'package:flutter/material.dart';

class RecordingIndicator extends StatefulWidget {
  final String? timerText;
  final String? text;

  const RecordingIndicator({
    super.key,
    this.timerText,
    this.text,
  });

  @override
  State<RecordingIndicator> createState() => _RecordingIndicatorState();
}

class _RecordingIndicatorState extends State<RecordingIndicator> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                return Opacity(
                  opacity: _controller.value * 0.5 + 0.5,
                  child: Container(
                    width: 12,
                    height: 12,
                    decoration: const BoxDecoration(
                      color: Color(0xFFE07A5F),
                      shape: BoxShape.circle,
                    ),
                  ),
                );
              },
            ),
            const SizedBox(width: 8),
            Text(
              widget.text ?? 'AI is listening...',
              style: const TextStyle(
                fontFamily: 'Figtree',
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1B1B1B),
              ),
            ),
          ],
        ),
        const SizedBox(height: 4),
        const Text(
          'Keep reading naturally.',
          style: TextStyle(
            fontFamily: 'Figtree',
            fontSize: 14,
            color: Color(0xFF6B7280),
          ),
        ),
        if (widget.timerText != null) ...[
          const SizedBox(height: 8),
          Text(
            widget.timerText!,
            style: const TextStyle(
              fontFamily: 'Figtree',
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Color(0xFF2D6A4F),
            ),
          ),
        ],
      ],
    );
  }
}
