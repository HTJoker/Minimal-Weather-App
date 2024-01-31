import "package:flutter/material.dart";
import "package:weather_app/theme/theme.dart";

class ThemeProvider with ChangeNotifier {
  ThemeData _themeData = lightMode;

  ThemeData get currentTheme => _themeData;

  set themeData(ThemeData theme) {
    themeData = theme;
    notifyListeners();
  }

  void toggleTheme() {
    _themeData = _themeData == lightMode ? darkMode : lightMode;
    notifyListeners();
  }
}
