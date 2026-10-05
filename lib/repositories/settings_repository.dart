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

  Future<double> getTtsSpeed();
  Future<void> setTtsSpeed(double speed);

  Future<int> getLastArticlesRefresh();
  Future<void> setLastArticlesRefresh(int timestamp);
}

class SharedPrefsSettingsRepository implements SettingsRepository {
  static const _keyOnboardingCompleted = 'fluento_onboarding_completed';
  static const _keyDarkMode = 'fluento_dark_mode';
  static const _keyCefrLevel = 'fluento_cefr_level';
  static const _keyLearningGoals = 'fluento_learning_goals';
  static const _keyUserName = 'fluento_user_name';
  static const _keyTtsSpeed = 'fluento_tts_speed';
  static const _keyLastArticlesRefresh = 'fluento_last_articles_refresh';

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

  @override
  Future<double> getTtsSpeed() async {
    final prefs = await _getPrefs();
    return prefs.getDouble(_keyTtsSpeed) ?? 1.0;
  }

  @override
  Future<void> setTtsSpeed(double speed) async {
    final prefs = await _getPrefs();
    await prefs.setDouble(_keyTtsSpeed, speed);
  }

  @override
  Future<int> getLastArticlesRefresh() async {
    final prefs = await _getPrefs();
    return prefs.getInt(_keyLastArticlesRefresh) ?? 0;
  }

  @override
  Future<void> setLastArticlesRefresh(int timestamp) async {
    final prefs = await _getPrefs();
    await prefs.setInt(_keyLastArticlesRefresh, timestamp);
  }
}

class MockSettingsRepository implements SettingsRepository {
  bool _onboardingCompleted;
  bool _darkMode;
  CefrLevel _cefrLevel;
  List<String> _goals;
  String _name;
  double _ttsSpeed;
  int _lastRefresh;

  MockSettingsRepository({
    this._onboardingCompleted = false,
    this._darkMode = false,
    this._cefrLevel = CefrLevel.b1,
    List<String>? goals,
    this._name = 'Abdelrahman',
    this._ttsSpeed = 1.0,
    this._lastRefresh = 0,
  }) : _goals = goals ?? ['Speaking', 'Pronunciation'];

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

  @override
  Future<double> getTtsSpeed() async => _ttsSpeed;

  @override
  Future<void> setTtsSpeed(double speed) async => _ttsSpeed = speed;

  @override
  Future<int> getLastArticlesRefresh() async => _lastRefresh;

  @override
  Future<void> setLastArticlesRefresh(int timestamp) async => _lastRefresh = timestamp;
}
