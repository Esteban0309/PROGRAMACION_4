import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class TuitionPage extends StatefulWidget {
  const TuitionPage({super.key});

  @override
  State<TuitionPage> createState() => _TuitionPageState();
}

class _TuitionPageState extends State<TuitionPage> {
  String creditsText = '';
  String costPerCreditText = '';
  String scholarshipLevel = 'Sin beca';
  String resultText = '';

  void calculateTuition() {
    final credits = int.tryParse(creditsText) ?? 0;
    final costPerCredit = double.tryParse(costPerCreditText.replaceAll(',', '.')) ?? 0.0;

    if (credits <= 0 || costPerCredit <= 0) {
      setState(() {
        resultText = 'Ingrese valores válidos';
      });
      return;
    }

    final baseTuition = credits * costPerCredit;
    double discount = 0;

    if (scholarshipLevel == 'Sin beca') {
      discount = 0;
    } else if (scholarshipLevel == 'Beca parcial') {
      discount = 30;
    } else if (scholarshipLevel == 'Beca completa') {
      discount = 100;
    }

    final discountAmount = baseTuition * discount / 100;
    final finalTuition = baseTuition - discountAmount;

    setState(() {
      resultText =
        'Créditos: $credits\n'
        'Costo por crédito: \$${costPerCredit.toStringAsFixed(2)}\n'
        'Matrícula base: \$${baseTuition.toStringAsFixed(2)}\n'
        'Nivel de beca: $scholarshipLevel\n'
        'Descuento: ${discount.toStringAsFixed(0)} %\n'
        'Monto de descuento: \$${discountAmount.toStringAsFixed(2)}\n'
        'Matrícula final: \$${finalTuition.toStringAsFixed(2)}';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cálculo de matrícula'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.go('/'),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'Matrícula según créditos y beca',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),

              TextField(
                decoration: const InputDecoration(
                  labelText: 'Número de créditos',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  creditsText = value;
                },
              ),

              const SizedBox(height: 16),

              TextField(
                decoration: const InputDecoration(
                  labelText: 'Costo por crédito (\$)',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  costPerCreditText = value;
                },
              ),

              const SizedBox(height: 16),

              DropdownButton<String>(
                value: scholarshipLevel,
                isExpanded: true,
                items: const [
                  DropdownMenuItem(
                    value: 'Sin beca',
                    child: Text('Sin beca'),
                  ),
                  DropdownMenuItem(
                    value: 'Beca parcial',
                    child: Text('Beca parcial'),
                  ),
                  DropdownMenuItem(
                    value: 'Beca completa',
                    child: Text('Beca completa'),
                  ),
                ],
                onChanged: (value) {
                  if (value == null) return;
                  setState(() {
                    scholarshipLevel = value;
                  });
                },
              ),

              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: calculateTuition,
                child: const Text('Calcular'),
              ),

              const SizedBox(height: 16),
              Text(resultText),
            ],
          ),
        ),
      ),
    );
  }
}
