import 'package:flutter/material.dart';

class FeedbackBubble extends StatelessWidget {
  final String? message;
  final String? text;
  final bool? isAI;

  const FeedbackBubble({
    super.key,
    this.message,
    this.text,
    this.isAI,
  });

  @override
  Widget build(BuildContext context) {
    final displayText = message ?? text ?? '';

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 36,
          height: 36,
          decoration: BoxDecoration(
            color: const Color(0xFF2D6A4F),
            shape: BoxShape.circle,
            border: Border.all(color: Colors.white, width: 2),
            boxShadow: const [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 4,
                offset: Offset(0, 2),
              ),
            ],
          ),
          alignment: Alignment.center,
          child: const Icon(
            Icons.smart_toy_rounded,
            color: Colors.white,
            size: 20,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: const BoxDecoration(
              color: Color(0xFFFDF8F0),
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(16),
                bottomLeft: Radius.circular(16),
                bottomRight: Radius.circular(16),
              ),
            ),
            child: Text(
              displayText,
              style: const TextStyle(
                fontFamily: 'Figtree',
                fontSize: 15,
                color: Color(0xFF1B1B1B),
                height: 1.4,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
