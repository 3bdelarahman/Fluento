import 'package:shared_preferences/shared_preferences.dart';
import 'package:fluento/models/cefr_level.dart';

abstract class SettingsRepository {
  Future<bool> isOnboardingCompleted();
  Future<void> setOnboardingCompleted(bool value);

  Future<bool> isDarkMode();
  Future<void> setDarkMode(bool value);

  Future<CefrLevel> getCefrLevel();
  Future<void> setCefrLevel(CefrLevel level);

  Future<List<String>> getLearningGoals();
  Future<void> setLearningGoals(List<String> goals);

  Future<String> getUserName();
  Future<void> setUserName(String name);
}

class SharedPrefsSettingsRepository implements SettingsRepository {
  static const _keyOnboardingCompleted = 'fluento_onboarding_completed';
  static const _keyDarkMode = 'fluento_dark_mode';
  static const _keyCefrLevel = 'fluento_cefr_level';
  static const _keyLearningGoals = 'fluento_learning_goals';
  static const _keyUserName = 'fluento_user_name';

  SharedPreferences? _prefs;

  Future<SharedPreferences> _getPrefs() async {
    _prefs ??= await SharedPreferences.getInstance();
    return _prefs!;
  }

  @override
  Future<bool> isOnboardingCompleted() async {
    final prefs = await _getPrefs();
    return prefs.getBool(_keyOnboardingCompleted) ?? false;
  }

  @override
  Future<void> setOnboardingCompleted(bool value) async {
    final prefs = await _getPrefs();
    await prefs.setBool(_keyOnboardingCompleted, value);
  }

  @override
  Future<bool> isDarkMode() async {
    final prefs = await _getPrefs();
    return prefs.getBool(_keyDarkMode) ?? false;
  }

  @override
  Future<void> setDarkMode(bool value) async {
    final prefs = await _getPrefs();
    await prefs.setBool(_keyDarkMode, value);
  }

  @override
  Future<CefrLevel> getCefrLevel() async {
    final prefs = await _getPrefs();
    final levelName = prefs.getString(_keyCefrLevel);
    if (levelName == null) return CefrLevel.b1;
    return CefrLevel.values.firstWhere(
      (l) => l.name.toLowerCase() == levelName.toLowerCase(),
      orElse: () => CefrLevel.b1,
    );
  }

  @override
  Future<void> setCefrLevel(CefrLevel level) async {
    final prefs = await _getPrefs();
    await prefs.setString(_keyCefrLevel, level.name);
  }

  @override
  Future<List<String>> getLearningGoals() async {
    final prefs = await _getPrefs();
    return prefs.getStringList(_keyLearningGoals) ?? ['Speaking', 'Pronunciation'];
  }

  @override
  Future<void> setLearningGoals(List<String> goals) async {
    final prefs = await _getPrefs();
    await prefs.setStringList(_keyLearningGoals, goals);
  }

  @override
  Future<String> getUserName() async {
    final prefs = await _getPrefs();
    return prefs.getString(_keyUserName) ?? 'Abdelrahman';
  }

  @override
  Future<void> setUserName(String name) async {
    final prefs = await _getPrefs();
    await prefs.setString(_keyUserName, name);
  }
}

class MockSettingsRepository implements SettingsRepository {
  bool _onboardingCompleted;
  bool _darkMode;
  CefrLevel _cefrLevel;
  List<String> _goals;
  String _name;

  MockSettingsRepository({
    bool onboardingCompleted = false,
    bool darkMode = false,
    CefrLevel cefrLevel = CefrLevel.b1,
    List<String>? goals,
    String name = 'Abdelrahman',
  })  : _onboardingCompleted = onboardingCompleted,
        _darkMode = darkMode,
        _cefrLevel = cefrLevel,
        _goals = goals ?? ['Speaking', 'Pronunciation'],
        _name = name;

  @override
  Future<bool> isOnboardingCompleted() async => _onboardingCompleted;

  @override
  Future<void> setOnboardingCompleted(bool value) async => _onboardingCompleted = value;

  @override
  Future<bool> isDarkMode() async => _darkMode;

  @override
  Future<void> setDarkMode(bool value) async => _darkMode = value;

  @override
  Future<CefrLevel> getCefrLevel() async => _cefrLevel;

  @override
  Future<void> setCefrLevel(CefrLevel level) async => _cefrLevel = level;

  @override
  Future<List<String>> getLearningGoals() async => List.from(_goals);

  @override
  Future<void> setLearningGoals(List<String> goals) async => _goals = List.from(goals);

  @override
  Future<String> getUserName() async => _name;

  @override
  Future<void> setUserName(String name) async => _name = name;
}
