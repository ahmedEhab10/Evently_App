import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode? cuurrentTheme = ThemeMode.dark;

  void changtheme(ThemeMode newtheme) {
    if (newtheme != cuurrentTheme) {
      cuurrentTheme = newtheme;
      notifyListeners();
    }
  }
}
