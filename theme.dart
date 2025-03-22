import 'package:flutter/material.dart';

class CustomTheme {
  static ThemeData getTheme(bool isDarkMode) {
    return isDarkMode ? _darkTheme() : _lightTheme();
  }

  static ThemeData _darkTheme() {
    return ThemeData.dark().copyWith(
      colorScheme: const ColorScheme.dark(
        primary: Color(0xFF1C315E),
        secondary: Color(0xFF37505C),
        tertiary: Color(0xFF00ADB5),
        surface: Color(0xFF0B132B),
        surfaceContainerHighest: Color(0xFF182237),
        outline: Color(0xFF4A6572),
        onPrimary: Colors.white,
        onSecondary: Colors.white,
        onTertiary: Colors.black,
        onSurface: Colors.white,
        onSurfaceVariant: Colors.white70,
        error: Colors.redAccent,
        onError: Colors.white,
      ),
    );
  }

  static ThemeData _lightTheme() {
    return ThemeData.light().copyWith(
      colorScheme: const ColorScheme.light(
        primary: Color(0xFFE0F2F7),
        secondary: Color(0xFFB2EBF2),
        tertiary: Color(0xFF00BCD4),
        surface: Colors.white,
        surfaceContainerHighest: Color(0xFFF0F8FF),
        outline: Color(0xFF80CBC4),
        onPrimary: Colors.black87,
        onSecondary: Colors.black87,
        onTertiary: Colors.white,
        onSurface: Colors.black87,
        onSurfaceVariant: Colors.black54,
        error: Colors.redAccent,
        onError: Colors.white,
      ),
    );
  }
}
