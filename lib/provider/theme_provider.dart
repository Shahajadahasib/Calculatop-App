import 'package:flutter/material.dart';

import '../services/shared_preferences.dart';

class ThemeProviders with ChangeNotifier {
  ThemePrefetences darkThemePreferences = ThemePrefetences();
  bool _darkTheme = false;
  bool get getDarkTheme => _darkTheme;

  set setDarkTheme(bool value) {
    _darkTheme = value;
    darkThemePreferences.setTheme(value);
    notifyListeners();
  }
}
