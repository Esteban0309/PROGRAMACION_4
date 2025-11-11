import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeController extends ChangeNotifier {
  static const _key = 'theme_mode'; // 'light' | 'dark' | 'system'
  ThemeMode _mode = ThemeMode.dark;

  ThemeMode get mode => _mode;

  Future<void> load() async {
    final prefs = await SharedPreferences.getInstance();
    final value = prefs.getString(_key);
    switch (value) {
      case 'light': _mode = ThemeMode.light; break;
      case 'system': _mode = ThemeMode.system; break;
      default: _mode = ThemeMode.dark;
    }
    notifyListeners();
  }

  Future<void> setMode(ThemeMode mode) async {
    _mode = mode;
    final prefs = await SharedPreferences.getInstance();
    final value = switch (mode) {
      ThemeMode.light => 'light',
      ThemeMode.dark => 'dark',
      ThemeMode.system => 'system',
    };
    await prefs.setString(_key, value);
    notifyListeners();
  }

  Future<void> toggle() async {
    // Alterna solo entre claro y oscuro (rápido para UI); puedes ampliar con 'system'
    await setMode(_mode == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark);
  }
}