import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AdmissionsHomePage extends StatelessWidget {
  const AdmissionsHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Menú Admisiones')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Seleccione una opción:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 24),

            ElevatedButton(
              onPressed: () => context.go('/average'),
              child: const Text('Promedio de notas'),
            ),
            const SizedBox(height: 12),

            ElevatedButton(
              onPressed: () => context.go('/tuition'),
              child: const Text('Cálculo de matrícula'),
            ),
            const SizedBox(height: 12),

            ElevatedButton(
              onPressed: () => context.go('/fees'),
              child: const Text('Derechos de inscripción'),
            ),
            const SizedBox(height: 12),

            ElevatedButton(
              onPressed: () => context.go('/credits'),
              child: const Text('Sumatoria de créditos'),
            ),
            const SizedBox(height: 12),

            ElevatedButton(
              onPressed: () => context.go('/propina'),
              child: const Text('Calculador de propina'),
            ),
            ElevatedButton(
              onPressed: () => context.go('/services'),
              child: const Text('Te amo profe'),
            ),
          ],
        ),
      ),
    );
  }
}
