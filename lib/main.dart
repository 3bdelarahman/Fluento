import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fluento/providers/app_state.dart';
import 'package:fluento/providers/profile_provider.dart';
import 'package:fluento/providers/progress_provider.dart';
import 'package:fluento/providers/vocabulary_provider.dart';
import 'package:fluento/app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AppState()),
        ChangeNotifierProvider(create: (_) => ProfileProvider()..init()),
        ChangeNotifierProvider(create: (_) => ProgressProvider()..init()),
        ChangeNotifierProvider(create: (_) => VocabularyProvider()..init()),
      ],
      child: const FluentoApp(),
    ),
  );
}
