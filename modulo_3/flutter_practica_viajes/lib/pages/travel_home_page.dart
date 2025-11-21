import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class TravelHomePage extends StatelessWidget {
  const TravelHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Menú Agencia de Viajes')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            const Text(
              'Seleccione una opción:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 24),

            ElevatedButton(
              onPressed: () => context.go('/plan'),
              child: const Text('Calcular paquete de viaje'),
            ),
            const SizedBox(height: 12),

            ElevatedButton(
              onPressed: () => context.go('/destination'),
              child: const Text('Ver destino destacado (Imagen)'),
            ),
            const SizedBox(height: 12),

            ElevatedButton(
              onPressed: () => context.go('/promo-video'),
              child: const Text('Video promocional MP4'),
            ),
            const SizedBox(height: 12),

            ElevatedButton(
              onPressed: () => context.go('/photos'),
              child: const Text('Carrusel de fotos'),
            ),
            const SizedBox(height: 12),

            ElevatedButton(
              onPressed: () => context.go('/videos'),
              child: const Text('Carrusel de videos MP4'),
            ),
            const SizedBox(height: 12),

            ElevatedButton(
              onPressed: () => context.go('/cotizar'),
              child: const Text('Cotizacion de viaje'),
            ),  
          ],
        ),
      ),
    );
  }
}
