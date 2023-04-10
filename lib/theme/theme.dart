import 'package:flutter/material.dart';

class PuzzlesTheme {
  static ThemeData get light {
    return ThemeData(
      appBarTheme: const AppBarTheme(
        color: Colors.greenAccent,
      ),
      colorScheme: ColorScheme.fromSwatch(
        accentColor: Colors.greenAccent,
      ),
      snackBarTheme: const SnackBarThemeData(
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  static ThemeData get dark {
    return ThemeData(
      appBarTheme: const AppBarTheme(
        color: Colors.greenAccent,
      ),
      colorScheme: ColorScheme.fromSwatch(
        brightness: Brightness.dark,
        accentColor: Colors.greenAccent,
      ),
      snackBarTheme: const SnackBarThemeData(
        behavior: SnackBarBehavior.floating,
      ),
    );
  }
}
