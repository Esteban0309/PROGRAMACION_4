import 'package:flutter/material.dart';

void main() {
  int contador = 0;

  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Contador Simple')),
        body: StatefulBuilder(
          builder: (context, setState) {
            return Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Valor: $contador', style: const TextStyle(fontSize: 28)),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () => setState(() => contador++),
                    child: const Text('+1'),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    ),
  );
} 