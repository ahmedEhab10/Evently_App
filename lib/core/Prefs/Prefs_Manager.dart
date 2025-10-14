import 'package:flutter/material.dart';
import 'package:myeventlyapp/core/const/constant_varibal.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PrefsManager {
  static late SharedPreferences pref;
  static Future<void> init() async {
    pref = await SharedPreferences.getInstance();
  }

  static void savecurrenttheme(String theme) {
    pref.setString(
      ConstantVaribal.currentTheme,
      theme == "Light" ? "Light" : "Dark",
    );
  }

  static ThemeMode? gettheme() {
    String? currenttheme = pref.getString(ConstantVaribal.currentTheme);
    if (currenttheme == null) {
      return null;
    } else if (currenttheme == "Light") {
      return ThemeMode.light;
    } else {
      return ThemeMode.dark;
    }
  }
}
