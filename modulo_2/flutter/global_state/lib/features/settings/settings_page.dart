import 'package:flutter/material.dart';
import '../../core/theme/theme_controller.dart';

class SettingsPage extends StatelessWidget {
  final ThemeController theme;
  const SettingsPage({super.key, required this.theme});

  @override
  Widget build(BuildContext context) {
    final isDark = theme.mode == ThemeMode.dark;

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        const Text('Ajustes', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        const SizedBox(height: 12),
        SwitchListTile(
          title: const Text('Tema oscuro'),
          value: isDark,
          onChanged: (_) => theme.toggle(),
          subtitle: const Text('Se guarda en shared_preferences'),
        ),
      ],
    );
  }
}