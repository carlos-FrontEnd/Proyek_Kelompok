import 'package:flutter/material.dart';
import 'package:home/main.dart';
class ThemeNotifier extends ChangeNotifier {
  ThemeData _currentTheme ;
   bool _isDarkMode;

  ThemeNotifier(this._currentTheme, this._isDarkMode);

  ThemeData get currentTheme => _currentTheme;
  bool get isDarkMode => _isDarkMode;

  void toggleTheme() {
    _isDarkMode = !_isDarkMode;
    _currentTheme = _isDarkMode ? darkTheme : lightTheme;
    notifyListeners();
  }

}