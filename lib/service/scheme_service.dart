import 'package:flutter/material.dart';
import '../config.dart';

class SchemeService with ChangeNotifier {
  static int _counter = prefs.getInt('counter') ?? 0;
  final List<ColorScheme> _list = [
    newDarkColorScheme,
    darkColorScheme,
    lightColorScheme
  ];

  ColorScheme getScheme() {
    return _list[_counter];
  }

  void setScheme(int i) {
    _counter = i;
    prefs.setInt('counter', _counter);
  }

  void toggleTheme() {
    setScheme((_counter + 1) % _list.length);
    notifyListeners();
  }
}

const lightColorScheme = ColorScheme(
  brightness: Brightness.light,
  primary: Color(0xFF306B06),
  onPrimary: Color(0xFFFFFFFF),
  primaryContainer: Color(0xFFB0F585),
  onPrimaryContainer: Color(0xFF092100),
  secondary: Color(0xFF56624B),
  onSecondary: Color(0xFFFFFFFF),
  secondaryContainer: Color(0xFFD9E7CA),
  onSecondaryContainer: Color(0xFF141E0D),
  tertiary: Color(0xFF386666),
  onTertiary: Color(0xFFFFFFFF),
  tertiaryContainer: Color(0xFFBBEBEB),
  onTertiaryContainer: Color(0xFF002020),
  error: Color(0xFFBA1A1A),
  errorContainer: Color(0xFFFFDAD6),
  onError: Color(0xFFFFFFFF),
  onErrorContainer: Color(0xFF410002),
  background: Color(0xFFFDFDF5),
  onBackground: Color(0xFF1A1C18),
  surface: Color(0xFFFDFDF5),
  onSurface: Color(0xFF1A1C18),
  surfaceVariant: Color(0xFFE0E4D6),
  onSurfaceVariant: Color(0xFF43483E),
  outline: Color(0xFF74796D),
  onInverseSurface: Color(0xFFF1F1EA),
  inverseSurface: Color(0xFF2F312C),
  inversePrimary: Color(0xFF95D86C),
  shadow: Color(0xFF000000),
  surfaceTint: Color(0xFF306B06),
  outlineVariant: Color(0xFFC4C8BB),
  scrim: Color(0xFF000000),
);

const darkColorScheme = ColorScheme(
  brightness: Brightness.dark,
  primary: Color(0xFF95D86C),
  onPrimary: Color(0xFF153800),
  primaryContainer: Color(0xFF215100),
  onPrimaryContainer: Color(0xFFB0F585),
  secondary: Color(0xFFBDCBAF),
  onSecondary: Color(0xFF283420),
  secondaryContainer: Color(0xFF3E4A35),
  onSecondaryContainer: Color(0xFFD9E7CA),
  tertiary: Color(0xFFA0CFCF),
  onTertiary: Color(0xFF003737),
  tertiaryContainer: Color(0xFF1E4E4E),
  onTertiaryContainer: Color(0xFFBBEBEB),
  error: Color(0xFFFFB4AB),
  errorContainer: Color(0xFF93000A),
  onError: Color(0xFF690005),
  onErrorContainer: Color(0xFFFFDAD6),
  background: Color(0xFF1A1C18),
  onBackground: Color(0xFFE3E3DC),
  surface: Color(0xFF1A1C18),
  onSurface: Color(0xFFE3E3DC),
  surfaceVariant: Color(0xFF43483E),
  onSurfaceVariant: Color(0xFFC4C8BB),
  outline: Color(0xFF8E9286),
  onInverseSurface: Color(0xFF1A1C18),
  inverseSurface: Color(0xFFE3E3DC),
  inversePrimary: Color(0xFF306B06),
  shadow: Color(0xFF000000),
  surfaceTint: Color(0xFF95D86C),
  outlineVariant: Color(0xFF43483E),
  scrim: Color(0xFF000000),
);

const newDarkColorScheme = ColorScheme(
  brightness: Brightness.dark,
  background: Colors.black,
  error: Color.fromARGB(255, 255, 0, 0),
  errorContainer: Colors.black,
  inversePrimary: Colors.white,
  inverseSurface: Colors.black,
  onBackground: Colors.white,
  onError: Colors.black,
  onErrorContainer: Colors.white,
  onInverseSurface: Colors.white,
  onPrimary: Colors.black,
  onPrimaryContainer: Colors.white,
  onSecondary: Colors.black,
  onSecondaryContainer: Colors.white,
  onSurface: Colors.white,
  onSurfaceVariant: Color.fromARGB(255, 255, 255, 255),
  onTertiary: Colors.black,
  onTertiaryContainer: Colors.white,
  outline: Colors.white,
  outlineVariant: Colors.black,
  primary: Color(0xFF95D86C),
  primaryContainer: Color(0xFF215100),
  scrim: Colors.black,
  secondary: Colors.white,
  secondaryContainer: Colors.black,
  shadow: Colors.black,
  surface: Color.fromARGB(255, 12, 12, 12),
  surfaceTint: Colors.white,
  surfaceVariant: Color.fromARGB(255, 55, 55, 55),
  tertiary: Colors.black,
  tertiaryContainer: Colors.white,
);
