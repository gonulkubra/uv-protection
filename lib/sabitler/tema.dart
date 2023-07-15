import 'package:flutter/material.dart';

ThemeData dark = ThemeData.dark();
ThemeData light = ThemeData.light();

class ThemeColorData with ChangeNotifier {
  bool _isDarkMode = false;
  bool get isDarkMode => _isDarkMode;

  ThemeData get themeColor {
    return _isDarkMode ? dark : light;
  }

  void temadegistir() {
    _isDarkMode = !_isDarkMode;
    notifyListeners();
  }
}
