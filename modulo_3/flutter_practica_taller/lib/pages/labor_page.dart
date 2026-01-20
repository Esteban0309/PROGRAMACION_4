import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LaborPage extends StatefulWidget {
  const LaborPage({super.key});

  @override
  State<LaborPage> createState() => _LaborPageState();
}

class _LaborPageState extends State<LaborPage> {
  String hoursText = '';
  String rateText = '';
  String resultText = '';

  void calculateLabor() {
    final hours = double.tryParse(hoursText.replaceAll(',', '.')) ?? 0.0;
    final rate = double.tryParse(rateText.replaceAll(',', '.')) ?? 0.0;

    if (hours <= 0 || rate <= 0) {
      setState(() {
        resultText = 'Ingrese horas y tarifa válidas';
      });
      return;
    }

    final laborCost = hours * rate;

    setState(() {
      resultText =
        'Horas trabajadas: ${hours.toStringAsFixed(2)}\n'
        'Tarifa por hora: \$${rate.toStringAsFixed(2)}\n'
        'Costo de mano de obra: \$${laborCost.toStringAsFixed(2)}';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mano de obra'),
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
              'Cálculo de mano de obra',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),

            TextField(
              decoration: const InputDecoration(
                labelText: 'Horas trabajadas',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                hoursText = value;
              },
            ),

            const SizedBox(height: 16),

            TextField(
              decoration: const InputDecoration(
                labelText: 'Tarifa por hora (\$)',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                rateText = value;
              },
            ),

            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: calculateLabor,
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
