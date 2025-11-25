import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PartsPage extends StatefulWidget {
  const PartsPage({super.key});

  @override
  State<PartsPage> createState() => _PartsPageState();
}

class _PartsPageState extends State<PartsPage> {
  String totalPartsText = '';
  String clientType = 'Normal';
  String resultText = '';

  void calculateParts() {
    final totalParts = double.tryParse(totalPartsText.replaceAll(',', '.')) ?? 0.0;

    if (totalParts <= 0) {
      setState(() {
        resultText = 'Ingrese un valor válido de repuestos';
      });
      return;
    }

    double discount = 0;

    if (clientType == 'Normal') {
      discount = 0;
    } else if (clientType == 'Frecuente') {
      discount = 10;
    } else if (clientType == 'Flota') {
      discount = 15;
    }

    final discountAmount = totalParts * discount / 100;
    final finalCost = totalParts - discountAmount;

    setState(() {
      resultText =
        'Tipo de cliente: $clientType\n'
        'Total repuestos: \$${totalParts.toStringAsFixed(2)}\n'
        'Descuento: ${discount.toStringAsFixed(0)} %\n'
        'Monto descuento: \$${discountAmount.toStringAsFixed(2)}\n'
        'Total a pagar: \$${finalCost.toStringAsFixed(2)}';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Costo de repuestos'),
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
              'Repuestos y descuentos',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),

            TextField(
              decoration: const InputDecoration(
                labelText: 'Total repuestos (\$)',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                totalPartsText = value;
              },
            ),

            const SizedBox(height: 16),

            DropdownButton<String>(
              value: clientType,
              isExpanded: true,
              items: const [
                DropdownMenuItem(
                  value: 'Normal',
                  child: Text('Cliente normal'),
                ),
                DropdownMenuItem(
                  value: 'Frecuente',
                  child: Text('Cliente frecuente'),
                ),
                DropdownMenuItem(
                  value: 'Flota',
                  child: Text('Cliente con flota'),
                ),
              ],
              onChanged: (value) {
                if (value == null) return;
                setState(() {
                  clientType = value;
                });
              },
            ),

            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: calculateParts,
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
