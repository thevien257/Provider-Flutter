import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  bool _isDarkMode = false;

  bool get isDarkMode => _isDarkMode;

  ThemeData get themeData {
    return _isDarkMode ? ThemeData.dark() : ThemeData.light();
  }

  void toggleTheme() {
    _isDarkMode = !_isDarkMode;
    notifyListeners(); // Thông báo cho tất cả listeners
  }
}
