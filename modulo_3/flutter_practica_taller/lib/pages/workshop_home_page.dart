import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class WorkshopHomePage extends StatelessWidget {
  const WorkshopHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Menú Taller Mecánico')),
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
              onPressed: () => context.go('/labor'),
              child: const Text('Costo de mano de obra'),
            ),
            const SizedBox(height: 12),

            ElevatedButton(
              onPressed: () => context.go('/parts'),
              child: const Text('Costo de repuestos'),
            ),
            const SizedBox(height: 12),

            ElevatedButton(
              onPressed: () => context.go('/service'),
              child: const Text('Paquete de servicio'),
            ),

            const SizedBox(height: 12),

            ElevatedButton(
              onPressed: () => context.go('/Aligment'),
              child: const Text('Alineacion y Balanceo'),
            ),

            const SizedBox(height: 12),

            ElevatedButton(
              onPressed: () => context.go('/diagnostico'),
              child: const Text('Diagnostico rapido'),
            ),
          ],
        ),
      ),
    );
  }
}
