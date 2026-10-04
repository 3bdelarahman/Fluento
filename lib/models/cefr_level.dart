import 'package:flutter/material.dart';

enum CefrLevel { a1, a2, b1, b2, c1 }

extension CefrLevelExtension on CefrLevel {
  String get label {
    switch (this) {
      case CefrLevel.a1:
        return 'A1';
      case CefrLevel.a2:
        return 'A2';
      case CefrLevel.b1:
        return 'B1';
      case CefrLevel.b2:
        return 'B2';
      case CefrLevel.c1:
        return 'C1';
    }
  }

  String get title {
    switch (this) {
      case CefrLevel.a1:
        return 'Beginner';
      case CefrLevel.a2:
        return 'Elementary';
      case CefrLevel.b1:
        return 'Intermediate';
      case CefrLevel.b2:
        return 'Upper Intermediate';
      case CefrLevel.c1:
        return 'Advanced';
    }
  }

  String get description {
    switch (this) {
      case CefrLevel.a1:
        return 'Focus on basic vocabulary and simple phrases.';
      case CefrLevel.a2:
        return 'Focus on simple conversations and basic grammar.';
      case CefrLevel.b1:
        return 'Focus on understanding common situations and expressing opinions.';
      case CefrLevel.b2:
        return 'Focus on fluent communication and complex topics.';
      case CefrLevel.c1:
        return 'Focus on advanced nuances, idioms, and professional fluency.';
    }
  }

  String get fullDescription {
    switch (this) {
      case CefrLevel.a1:
        return 'Evaluates basic reading comprehension and the ability to recognize common words. Pronunciation feedback focuses on individual sounds.';
      case CefrLevel.a2:
        return 'Evaluates understanding of simple texts and everyday language. Pronunciation feedback includes basic word stress and rhythm.';
      case CefrLevel.b1:
        return 'Evaluates comprehension of straightforward articles and familiar subjects. Pronunciation feedback covers sentence stress and basic linking.';
      case CefrLevel.b2:
        return 'Evaluates the ability to understand the main ideas of complex text. Pronunciation feedback addresses rhythm, intonation, and connected speech.';
      case CefrLevel.c1:
        return 'Evaluates understanding of a wide range of demanding, longer texts. Pronunciation focuses on natural flow, subtle reductions, and advanced intonation patterns.';
    }
  }

  Color get color {
    switch (this) {
      case CefrLevel.a1:
        return const Color(0xFF4DB6AC);
      case CefrLevel.a2:
        return const Color(0xFF4DD0E1);
      case CefrLevel.b1:
        return const Color(0xFF81C784);
      case CefrLevel.b2:
        return const Color(0xFFFFB74D);
      case CefrLevel.c1:
        return const Color(0xFFE57373);
    }
  }

  int get sortOrder {
    switch (this) {
      case CefrLevel.a1:
        return 1;
      case CefrLevel.a2:
        return 2;
      case CefrLevel.b1:
        return 3;
      case CefrLevel.b2:
        return 4;
      case CefrLevel.c1:
        return 5;
    }
  }
}
