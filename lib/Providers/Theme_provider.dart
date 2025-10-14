import 'package:flutter/material.dart';
import 'package:myeventlyapp/core/Prefs/Prefs_Manager.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode? cuurrentTheme = PrefsManager.gettheme() ?? ThemeMode.light;

  void changtheme(ThemeMode newtheme) {
    if (newtheme != cuurrentTheme) {
      cuurrentTheme = newtheme;
      notifyListeners();
    }
  }
}
