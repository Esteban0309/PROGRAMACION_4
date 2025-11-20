import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AtmFeePage extends StatefulWidget {
  const AtmFeePage({super.key});

  @override
  State<AtmFeePage> createState() => _AtmFeePageState();
}

class _AtmFeePageState extends State<AtmFeePage> {
  String cardType = 'Débito nacional';
  String amountText = '';
  String resultText = '';

  void calculateAtmFee() {
    final amount = double.tryParse(amountText.replaceAll(',', '.')) ?? 0.0;

    if (amount <= 0) {
      setState(() {
        resultText = 'Ingrese un monto válido';
      });
      return;
    }

    double fee = 0.0;

    if (cardType == 'Débito nacional') {
      fee = 0.5;
    } else if (cardType == 'Débito internacional') {
      fee = 1.5;
    } else if (cardType == 'Crédito') {
      fee = 2.0;
    }

    final total = amount + fee;

    setState(() {
      resultText =
        'Tarjeta: $cardType\n'
        'Comisión: \$${fee.toStringAsFixed(2)}\n'
        'Total debitado: \$${total.toStringAsFixed(2)}';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Comisión de cajero'),
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
              'Cálculo de comisión en cajero',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),

            DropdownButton<String>(
              value: cardType,
              isExpanded: true,
              items: const [
                DropdownMenuItem(
                  value: 'Débito nacional',
                  child: Text('Tarjeta débito nacional'),
                ),
                DropdownMenuItem(
                  value: 'Débito internacional',
                  child: Text('Tarjeta débito internacional'),
                ),
                DropdownMenuItem(
                  value: 'Crédito',
                  child: Text('Tarjeta de crédito'),
                ),
              ],
              onChanged: (value) {
                if (value == null) return;
                setState(() {
                  cardType = value;
                });
              },
            ),

            const SizedBox(height: 16),

            TextField(
              decoration: const InputDecoration(
                labelText: 'Monto a retirar (\$)',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                amountText = value;
              },
            ),

            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: calculateAtmFee,
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
