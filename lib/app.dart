import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fluento/theme/app_theme.dart';
import 'package:fluento/providers/app_state.dart';
import 'package:fluento/screens/onboarding/onboarding_flow.dart';
import 'package:fluento/screens/main_shell.dart';

class FluentoApp extends StatelessWidget {
  const FluentoApp({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = context.watch<AppState>().isDarkMode;
    final onboardingComplete = context.watch<AppState>().onboardingComplete;

    return MaterialApp(
      title: 'Fluento',
      theme: AppTheme.lightTheme(),
      darkTheme: AppTheme.darkTheme(),
      themeMode: isDarkMode ? ThemeMode.dark : ThemeMode.light,
      debugShowCheckedModeBanner: false,
      home: onboardingComplete ? const MainShell() : const OnboardingFlow(),
    );
  }
}
