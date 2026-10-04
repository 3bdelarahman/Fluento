import 'package:flutter/material.dart';

class MicButton extends StatefulWidget {
  final bool isRecording;
  final VoidCallback? onTap;
  final VoidCallback? onPressed;
  final String? label;
  final double size;

  const MicButton({
    super.key,
    required this.isRecording,
    this.onTap,
    this.onPressed,
    this.label,
    this.size = 72,
  });

  @override
  State<MicButton> createState() => _MicButtonState();
}

class _MicButtonState extends State<MicButton> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final callback = widget.onPressed ?? widget.onTap;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        GestureDetector(
          onTap: callback,
          child: AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              return Container(
                width: widget.size,
                height: widget.size,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: widget.isRecording
                      ? const Color(0xFFE07A5F)
                      : const Color(0xFF2D6A4F),
                  boxShadow: [
                    BoxShadow(
                      color: (widget.isRecording ? const Color(0xFFE07A5F) : const Color(0xFF2D6A4F))
                          .withValues(alpha: widget.isRecording ? 0.4 + (_controller.value * 0.3) : 0.3),
                      blurRadius: widget.isRecording ? 15 + (_controller.value * 10) : 10,
                      spreadRadius: widget.isRecording ? 4 + (_controller.value * 6) : 2,
                    ),
                  ],
                ),
                child: Icon(
                  widget.isRecording ? Icons.stop_rounded : Icons.mic_rounded,
                  color: Colors.white,
                  size: widget.size * 0.44,
                ),
              );
            },
          ),
        ),
        if (widget.label != null) ...[
          const SizedBox(height: 12),
          Text(
            widget.label!,
            style: const TextStyle(
              fontFamily: 'Figtree',
              fontSize: 14,
              color: Color(0xFF1B1B1B),
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ],
    );
  }
}
