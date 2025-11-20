import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoanPage extends StatefulWidget {
  const LoanPage({super.key});

  @override
  State<LoanPage> createState() => _LoanPageState();
}

class _LoanPageState extends State<LoanPage> {
  String loanType = 'Personal';
  String amountText = '';
  String monthsText = '';
  String resultText = '';

  void calculateLoan() {
    final amount = double.tryParse(amountText.replaceAll(',', '.')) ?? 0.0;
    final months = double.tryParse(monthsText.replaceAll(',', '.')) ?? 0.0;

    if (amount <= 0 || months <= 0) {
      setState(() {
        resultText = 'Ingrese valores válidos';
      });
      return;
    }

    double monthlyRate = 0.0;

    if (loanType == 'Personal') {
      monthlyRate = 2.0;
    } else if (loanType == 'Hipotecario') {
      monthlyRate = 1.0;
    } else if (loanType == 'Automotriz') {
      monthlyRate = 1.5;
    }

    final totalInterest = amount * (monthlyRate / 100) * months;
    final totalToPay = amount + totalInterest;
    final monthlyPayment = totalToPay / months;

    setState(() {
      resultText =
        'Tipo: $loanType\n'
        'Interés total: \$${totalInterest.toStringAsFixed(2)}\n'
        'Total a pagar: \$${totalToPay.toStringAsFixed(2)}\n'
        'Cuota mensual: \$${monthlyPayment.toStringAsFixed(2)}';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Simulador de préstamo'),
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
              'Cálculo aproximado de préstamo',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),

            DropdownButton<String>(
              value: loanType,
              isExpanded: true,
              items: const [
                DropdownMenuItem(
                  value: 'Personal',
                  child: Text('Préstamo personal'),
                ),
                DropdownMenuItem(
                  value: 'Hipotecario',
                  child: Text('Préstamo hipotecario'),
                ),
                DropdownMenuItem(
                  value: 'Automotriz',
                  child: Text('Préstamo automotriz'),
                ),
              ],
              onChanged: (value) {
                if (value == null) return;
                setState(() {
                  loanType = value;
                });
              },
            ),

            const SizedBox(height: 16),

            TextField(
              decoration: const InputDecoration(
                labelText: 'Monto del préstamo (\$)',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                amountText = value;
              },
            ),

            const SizedBox(height: 16),

            TextField(
              decoration: const InputDecoration(
                labelText: 'Plazo (meses)',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                monthsText = value;
              },
            ),

            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: calculateLoan,
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
