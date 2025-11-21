import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HospitalHomePage extends StatelessWidget {
  const HospitalHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Menú Hospital')),
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
              onPressed: () => context.go('/bmi'),
              child: const Text('Calcular IMC'),
            ),
            const SizedBox(height: 12),

            ElevatedButton(
              onPressed: () => context.go('/dose'),
              child: const Text('Calcular dosis por peso'),
            ),
            const SizedBox(height: 12),

            ElevatedButton(
              onPressed: () => context.go('/appointment'),
              child: const Text('Costo de cita médica'),
            ),
            ElevatedButton(
              onPressed: () => context.go('/costo_host'),
              child: const Text('Costo de hospitalizacion'),
            ),
          ],
        ),
      ),
    );
  }
}
