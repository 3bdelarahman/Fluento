import 'package:flutter/material.dart';
import 'package:fluento/models/cefr_level.dart';
import 'package:fluento/repositories/settings_repository.dart';

class ProfileProvider extends ChangeNotifier {
  final SettingsRepository _settingsRepository;

  bool _isInitialized = false;
  bool _onboardingComplete = false;
  bool _isDarkMode = false;
  CefrLevel _currentLevel = CefrLevel.b1;
  List<String> _learningGoals = ['Speaking', 'Pronunciation'];
  String _userName = 'Abdelrahman';

  ProfileProvider({SettingsRepository? settingsRepository})
      : _settingsRepository = settingsRepository ?? SharedPrefsSettingsRepository();

  bool get isInitialized => _isInitialized;
  bool get onboardingComplete => _onboardingComplete;
  bool get isDarkMode => _isDarkMode;
  CefrLevel get currentLevel => _currentLevel;
  List<String> get learningGoals => List.unmodifiable(_learningGoals);
  String get userName => _userName;

  Future<void> init() async {
    if (_isInitialized) return;
    _onboardingComplete = await _settingsRepository.isOnboardingCompleted();
    _isDarkMode = await _settingsRepository.isDarkMode();
    _currentLevel = await _settingsRepository.getCefrLevel();
    _learningGoals = await _settingsRepository.getLearningGoals();
    _userName = await _settingsRepository.getUserName();
    _isInitialized = true;
    notifyListeners();
  }

  Future<void> completeOnboarding() async {
    _onboardingComplete = true;
    notifyListeners();
    await _settingsRepository.setOnboardingCompleted(true);
  }

  Future<void> setLevel(CefrLevel level) async {
    _currentLevel = level;
    notifyListeners();
    await _settingsRepository.setCefrLevel(level);
  }

  Future<void> setGoals(List<String> goals) async {
    _learningGoals = List.from(goals);
    notifyListeners();
    await _settingsRepository.setLearningGoals(_learningGoals);
  }

  Future<void> toggleDarkMode() async {
    _isDarkMode = !_isDarkMode;
    notifyListeners();
    await _settingsRepository.setDarkMode(_isDarkMode);
  }

  Future<void> setUserName(String name) async {
    _userName = name;
    notifyListeners();
    await _settingsRepository.setUserName(name);
  }
}
