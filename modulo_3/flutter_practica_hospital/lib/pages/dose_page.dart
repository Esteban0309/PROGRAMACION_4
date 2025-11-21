import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DosePage extends StatefulWidget {
  const DosePage({super.key});

  @override
  State<DosePage> createState() => _DosePageState();
}

class _DosePageState extends State<DosePage> {
  String weightText = '';
  String dosePerKgText = '';
  String resultText = '';

  void calculateDose() {
    final weight = double.tryParse(weightText.replaceAll(',', '.')) ?? 0.0;
    final dosePerKg = double.tryParse(dosePerKgText.replaceAll(',', '.')) ?? 0.0;

    if (weight <= 0 || dosePerKg <= 0) {
      setState(() {
        resultText = 'Ingrese valores válidos';
      });
      return;
    }

    final totalDose = weight * dosePerKg;

    setState(() {
      resultText =
        'Peso: ${weight.toStringAsFixed(2)} kg\n'
        'Dosis por kg: ${dosePerKg.toStringAsFixed(2)} mg/kg\n'
        'Dosis total: ${totalDose.toStringAsFixed(2)} mg';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dosis por peso'),
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
              'Cálculo de dosis basada en peso',
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
                labelText: 'Dosis (mg/kg)',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                dosePerKgText = value;
              },
            ),

            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: calculateDose,
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
