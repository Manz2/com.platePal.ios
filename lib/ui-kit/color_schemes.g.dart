import 'package:flutter/material.dart';
import '../config.dart';

class PlatePalColorScheme with ChangeNotifier {
  static int _counter = prefs.getInt('counter') ?? 0;
  final List<ColorScheme> _list = [darkColorScheme, lightColorScheme, newDarkColorScheme];

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
  primary: Color(0xFFEBB2FF),
  onPrimary: Color(0xFF520072),
  primaryContainer: Color(0xFF7400A0),
  onPrimaryContainer: Color(0xFFF8D8FF),
  secondary: Color(0xFFD4C0D7),
  onSecondary: Color(0xFF392C3D),
  secondaryContainer: Color(0xFF504255),
  onSecondaryContainer: Color(0xFFF1DCF4),
  tertiary: Color(0xFFEBB2FF),
  onTertiary: Color(0xFF520072),
  tertiaryContainer: Color(0xFF7400A0),
  onTertiaryContainer: Color(0xFFF8D8FF),
  error: Color(0xFFFFB4AB),
  errorContainer: Color(0xFF93000A),
  onError: Color(0xFF690005),
  onErrorContainer: Color(0xFFFFDAD6),
  background: Color(0xFF24005A),
  onBackground: Color(0xFFEADDFF),
  surface: Color(0xFF24005A),
  onSurface: Color(0xFFEADDFF),
  surfaceVariant: Color(0xFF4C444D),
  onSurfaceVariant: Color(0xFFCEC3CD),
  outline: Color(0xFF978E97),
  onInverseSurface: Color(0xFF24005A),
  inverseSurface: Color(0xFFEADDFF),
  inversePrimary: Color(0xFF9800D0),
  shadow: Color(0xFF000000),
  surfaceTint: Color(0xFFEBB2FF),
  outlineVariant: Color(0xFF4C444D),
  scrim: Color(0xFF000000),
);
