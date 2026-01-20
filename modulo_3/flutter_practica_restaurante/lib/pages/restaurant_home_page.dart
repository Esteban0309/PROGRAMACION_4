import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RestaurantHomePage extends StatelessWidget {
  const RestaurantHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Menú Restaurante')),
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
              onPressed: () => context.go('/order'),
              child: const Text('Total de la cuenta con IVA'),
            ),
            const SizedBox(height: 12),

            ElevatedButton(
              onPressed: () => context.go('/tip'),
              child: const Text('Calcular propina'),
            ),
            const SizedBox(height: 12),

            ElevatedButton(
              onPressed: () => context.go('/split'),
              child: const Text('Dividir cuenta'),
            ),
            const SizedBox(height: 12),

            ElevatedButton(
              onPressed: () => context.go('/nueva'),
              child: const Text('Menu del día'),
            ),  
          ],
        ),
      ),
    );
  }
}
