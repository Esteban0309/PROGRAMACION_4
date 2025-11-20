import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class TipPage extends StatefulWidget {
  const TipPage({super.key});

  @override
  State<TipPage> createState() => _TipPageState();
}

class _TipPageState extends State<TipPage> {
  String serviceLevel = 'Normal';
  String amountText = '';
  String resultText = '';

  void calculateTip() {
    final amount = double.tryParse(amountText.replaceAll(',', '.')) ?? 0.0;

    if (amount <= 0) {
      setState(() {
        resultText = 'Ingrese un monto válido';
      });
      return;
    }

    double percentage = 0;

    if (serviceLevel == 'Normal') {
      percentage = 10;
    } else if (serviceLevel == 'Bueno') {
      percentage = 12;
    } else if (serviceLevel == 'Excelente') {
      percentage = 15;
    }

    final tip = amount * percentage / 100;
    final total = amount + tip;

    setState(() {
      resultText =
        'Servicio: $serviceLevel\n'
        'Propina: ${percentage.toStringAsFixed(0)} %\n'
        'Valor propina: \$${tip.toStringAsFixed(2)}\n'
        'Total con propina: \$${total.toStringAsFixed(2)}';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calcular propina'),
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
              'Propina según nivel de servicio',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),

            DropdownButton<String>(
              value: serviceLevel,
              isExpanded: true,
              items: const [
                DropdownMenuItem(
                  value: 'Normal',
                  child: Text('Servicio normal'),
                ),
                DropdownMenuItem(
                  value: 'Bueno',
                  child: Text('Servicio bueno'),
                ),
                DropdownMenuItem(
                  value: 'Excelente',
                  child: Text('Servicio excelente'),
                ),
              ],
              onChanged: (value) {
                if (value == null) return;
                setState(() {
                  serviceLevel = value;
                });
              },
            ),

            const SizedBox(height: 16),
            TextField(
              decoration: const InputDecoration(
                labelText: 'Monto de la cuenta (\$)',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                amountText = value;
              },
            ),

            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: calculateTip,
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
