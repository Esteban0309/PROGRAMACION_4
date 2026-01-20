import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class InterestPage extends StatefulWidget {
  const InterestPage({super.key});

  @override
  State<InterestPage> createState() => _InterestPageState();
}

class _InterestPageState extends State<InterestPage> {
  String accountType = 'Ahorros';
  String amountText = '';
  String resultText = '';

  void calculateInterest() {
    final amount = double.tryParse(amountText.replaceAll(',', '.')) ?? 0.0;

    if (amount <= 0) {
      setState(() {
        resultText = 'Ingrese un monto válido';
      });
      return;
    }

    double rate = 0.0;

    if (accountType == 'Ahorros') {
      rate = 3.0;
    } else if (accountType == 'Corriente') {
      rate = 1.0;
    } else if (accountType == 'Plazo fijo') {
      rate = 5.0;
    }

    final interest = amount * rate / 100;
    final total = amount + interest;

    setState(() {
      resultText =
        'Tipo: $accountType\n'
        'Interés anual: ${rate.toStringAsFixed(1)} %\n'
        'Interés ganado: \$${interest.toStringAsFixed(2)}\n'
        'Monto total: \$${total.toStringAsFixed(2)}';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Interés de cuenta'),
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
              'Calcular interés simple (1 año)',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),

            DropdownButton<String>(
              value: accountType,
              isExpanded: true,
              items: const [
                DropdownMenuItem(
                  value: 'Ahorros',
                  child: Text('Cuenta de ahorros'),
                ),
                DropdownMenuItem(
                  value: 'Corriente',
                  child: Text('Cuenta corriente'),
                ),
                DropdownMenuItem(
                  value: 'Plazo fijo',
                  child: Text('Depósito a plazo fijo'),
                ),
              ],
              onChanged: (value) {
                if (value == null) return;
                setState(() {
                  accountType = value;
                });
              },
            ),

            const SizedBox(height: 16),

            TextField(
              decoration: const InputDecoration(
                labelText: 'Monto inicial (\$)',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                amountText = value;
              },
            ),

            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: calculateInterest,
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
