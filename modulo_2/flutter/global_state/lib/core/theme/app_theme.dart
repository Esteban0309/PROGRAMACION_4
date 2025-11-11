import 'package:flutter/material.dart';

class AppTheme {
  // Paleta base (oscuro)
  static const bg = Color(0xFF0d1117);
  static const card = Color(0xFF161b22);
  static const text = Color(0xFFc9d1d9);
  static const primary = Color(0xFF58a6ff);
  static const accent = Color(0xFF2ea043);
  static const border = Color(0xFF30363d);

  static ThemeData dark() {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      scaffoldBackgroundColor: bg,
      colorScheme: ColorScheme.fromSeed(
        seedColor: primary,
        brightness: Brightness.dark,
        primary: primary,
        secondary: accent,
        surface: card,
        outline: border,
      ),
      textTheme: const TextTheme(bodyMedium: TextStyle(color: text)),
      appBarTheme: const AppBarTheme(
        backgroundColor: card,
        foregroundColor: primary,
        elevation: 0,
      ),
      cardColor: card,
    );
  }

  // Variante clara coherente
  static ThemeData light() {
    const lBg = Color(0xFFF5F7FB);
    const lText = Color(0xFF222222);
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      scaffoldBackgroundColor: lBg,
      colorScheme: ColorScheme.fromSeed(
        seedColor: primary,
        brightness: Brightness.light,
        primary: primary,
        secondary: accent,
        surface: Colors.white,
        outline: const Color(0xFFE2E8F0),
      ),
      textTheme: const TextTheme(bodyMedium: TextStyle(color: lText)),
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.white,
        foregroundColor: primary,
        elevation: 0,
      ),
      cardColor: Colors.white,
    );
  }
}