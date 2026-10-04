import 'package:flutter/material.dart';
import 'package:fluento/models/cefr_level.dart'; // Assumed to exist

class LevelBadge extends StatelessWidget {
  final CefrLevel level;

  const LevelBadge({super.key, required this.level});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: level.color,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        level.name.toUpperCase(),
        style: const TextStyle(
          color: Colors.white,
          fontSize: 12,
          fontWeight: FontWeight.bold,
          fontFamily: 'Figtree',
        ),
      ),
    );
  }
}
