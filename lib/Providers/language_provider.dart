import 'package:flutter/material.dart';
import 'package:myeventlyapp/core/Prefs/Prefs_Manager.dart';

class LanguageProvider extends ChangeNotifier {
  String currentLanguage = PrefsManager.getSavedLanguage() ?? "en";

  void changeAppLanguage(String newLang) {
    if (currentLanguage == newLang) return;
    currentLanguage = newLang;
    PrefsManager.saveLanguage(currentLanguage);
    notifyListeners();
  }

  bool get isEnglish => currentLanguage == "en";
}
