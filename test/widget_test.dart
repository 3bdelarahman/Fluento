import 'package:flutter_test/flutter_test.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:fluento/providers/app_state.dart';
import 'package:fluento/app.dart';
import 'package:fluento/theme/app_theme.dart';

void main() {
  setUpAll(() {
    GoogleFonts.config.allowRuntimeFetching = false;
  });

  group('Phase 0 - Theme & Crash Verification Tests', () {
    testWidgets('AppTheme.lightTheme builds TextTheme without _TypeError on fontSize', (WidgetTester tester) async {
      final theme = AppTheme.lightTheme();
      expect(theme.textTheme.displayLarge?.fontSize, 57.0);
      expect(theme.textTheme.headlineMedium?.fontSize, 28.0);
      expect(theme.textTheme.bodyLarge?.fontSize, 16.0);
      expect(theme.textTheme.labelSmall?.fontSize, 11.0);
      expect(theme.elevatedButtonTheme.style?.textStyle?.resolve({})?.fontSize, 16.0);
      expect(theme.outlinedButtonTheme.style?.textStyle?.resolve({})?.fontSize, 16.0);
    });

    testWidgets('AppTheme.darkTheme builds TextTheme without _TypeError on fontSize', (WidgetTester tester) async {
      final theme = AppTheme.darkTheme();
      expect(theme.textTheme.displayLarge?.fontSize, 57.0);
      expect(theme.textTheme.headlineMedium?.fontSize, 28.0);
      expect(theme.textTheme.bodyLarge?.fontSize, 16.0);
      expect(theme.textTheme.labelSmall?.fontSize, 11.0);
      expect(theme.elevatedButtonTheme.style?.textStyle?.resolve({})?.fontSize, 16.0);
      expect(theme.outlinedButtonTheme.style?.textStyle?.resolve({})?.fontSize, 16.0);
    });

    testWidgets('FluentoApp builds, inflates, and renders without error', (WidgetTester tester) async {
      await tester.pumpWidget(
        ChangeNotifierProvider(
          create: (_) => AppState(),
          child: const FluentoApp(),
        ),
      );

      // Verify FluentoApp built without throwing any runtime TypeError on font sizes
      expect(find.byType(FluentoApp), findsOneWidget);
    });
  });
}
