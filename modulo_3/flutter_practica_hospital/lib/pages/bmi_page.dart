import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BmiPage extends StatefulWidget {
  const BmiPage({super.key});

  @override
  State<BmiPage> createState() => _BmiPageState();
}

class _BmiPageState extends State<BmiPage> {
  String weightText = '';
  String heightText = '';
  String resultText = '';

  void calculateBmi() {
    final weight = double.tryParse(weightText.replaceAll(',', '.')) ?? 0.0;
    final height = double.tryParse(heightText.replaceAll(',', '.')) ?? 0.0;

    if (weight <= 0 || height <= 0) {
      setState(() {
        resultText = 'Ingrese peso y talla válidos';
      });
      return;
    }

    final bmi = weight / (height * height);
    String category;

    if (bmi < 18.5) {
      category = 'Bajo peso';
    } else if (bmi < 25) {
      category = 'Normal';
    } else if (bmi < 30) {
      category = 'Sobrepeso';
    } else {
      category = 'Obesidad';
    }

    setState(() {
      resultText =
        'IMC: ${bmi.toStringAsFixed(2)}\n'
        'Categoría: $category';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cálculo de IMC'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.go('/'),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Índice de masa corporal (IMC)',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),

            TextField(
              decoration: const InputDecoration(
                labelText: 'Peso (kg)',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                weightText = value;
              },
            ),

            const SizedBox(height: 16),

            TextField(
              decoration: const InputDecoration(
                labelText: 'Talla (m)',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                heightText = value;
              },
            ),

            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: calculateBmi,
              child: const Text('Calcular'),
            ),

            const SizedBox(height: 16),
            Text(resultText),
          ],
        ),
      ),
    );
  }
}
