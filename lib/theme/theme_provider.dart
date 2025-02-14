import 'package:flutter/material.dart';
import 'package:trying_learn/theme/theme.dart';

class ThemeProvider with ChangeNotifier, WidgetsBindingObserver {
  ThemeData _themeData = AppTheme.lightTheme;

  ThemeData get themeData => _themeData;

  set themeData(ThemeData themeData) {
    _themeData = themeData;
    notifyListeners();
  }

  ThemeProvider() {
    WidgetsBinding.instance.addObserver(this);
    _updateThemeBasedOnSystem();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangePlatformBrightness() {
    _updateThemeBasedOnSystem();
  }

  void _updateThemeBasedOnSystem() {
    if (WidgetsBinding.instance.window.platformBrightness == Brightness.dark) {
      _themeData = AppTheme.darkTheme;
    } else {
      _themeData = AppTheme.lightTheme;
    }
    notifyListeners();
  }

  void toggleTheme() {
    if (_themeData == AppTheme.lightTheme) {
      themeData = AppTheme.darkTheme;
    } else {
      themeData = AppTheme.lightTheme;
    }
  }
}
