import 'package:flutter/material.dart';
import '../config.dart';

class LocaleService with ChangeNotifier {
  Locale _locale = Locale(prefs.getString("language") ?? "de");
  final Map<Locale, String> _map = {
    const Locale('en'):'English' ,
    const Locale('de'):'Deutsch' ,
  };

  Map<Locale, String> getAvailablelocales() {
    return _map;
  }

  Locale getLocale() {
    return _locale;
  }

  void setLocale(locale) {
    _locale = locale;
    prefs.setString('language', locale.languageCode);
    notifyListeners();
  }
}