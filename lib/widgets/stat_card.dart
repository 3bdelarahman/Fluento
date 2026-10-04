import 'package:flutter/material.dart';

class StatCard extends StatelessWidget {
  final IconData icon;
  final String value;
  final String? label;
  final String? title;
  final Color? accentColor;
  final Color? color;

  const StatCard({
    super.key,
    required this.icon,
    required this.value,
    this.label,
    this.title,
    this.accentColor,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    final displayLabel = label ?? title ?? '';
    final displayColor = accentColor ?? color ?? const Color(0xFF2D6A4F);

    return Card(
      elevation: 0,
      color: const Color(0xFFFDF8F0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 12.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              color: displayColor,
              size: 28,
            ),
            const SizedBox(height: 8),
            Text(
              value,
              style: const TextStyle(
                fontFamily: 'Fraunces',
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1B1B1B),
              ),
            ),
            const SizedBox(height: 4),
            Text(
              displayLabel,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontFamily: 'Figtree',
                fontSize: 12,
                color: Color(0xFF6B7280),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
