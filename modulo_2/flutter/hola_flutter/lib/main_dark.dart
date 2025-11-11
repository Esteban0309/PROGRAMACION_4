import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const bg = Color(0xFF0d1117);
    const card = Color(0xFF161b22);
    const text = Color(0xFFc9d1d9);
    const primary = Color(0xFF58a6ff);
    const accent = Color(0xFF2ea043);
    const border = Color(0xFF30363d);

    final theme = ThemeData(
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
      cardColor: card,
      textTheme: const TextTheme(bodyMedium: TextStyle(color: text)),
      appBarTheme: const AppBarTheme(
        backgroundColor: Color(0xFF161b22),
        foregroundColor: Color(0xFF58a6ff),
        elevation: 0,
      ),
    );

    return MaterialApp(
      title: 'Flutter Dark Counter',
      debugShowCheckedModeBanner: false,
      theme: theme,
      home: const CounterPage(),
    );
  }
}

class CounterPage extends StatefulWidget {
  const CounterPage({super.key});
  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Contador')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('Has presionado:', style: TextStyle(fontSize: 18)),
            const SizedBox(height: 8),
            Text('$count', style: const TextStyle(fontSize: 56, fontWeight: FontWeight.w800)),
            const SizedBox(height: 16),
            Card(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    FilledButton.tonal(
                      onPressed: () => setState(() => count = (count - 1).clamp(0, 999999)),
                      child: const Text('-1'),
                    ),
                    const SizedBox(width: 12),
                    FilledButton(
                      onPressed: () => setState(() => count++),
                      child: const Text('+1'),
                    ),
                    const SizedBox(width: 12),
                    OutlinedButton(
                      onPressed: () => setState(() => count = 0),
                      child: const Text('Reset'),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}