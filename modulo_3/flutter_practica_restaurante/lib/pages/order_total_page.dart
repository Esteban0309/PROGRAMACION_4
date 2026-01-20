import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class OrderTotalPage extends StatefulWidget {
  const OrderTotalPage({super.key});

  @override
  State<OrderTotalPage> createState() => _OrderTotalPageState();
}

class _OrderTotalPageState extends State<OrderTotalPage> {
  String subtotalText = '';
  String resultText = '';

  void calculateTotal() {
    final subtotal = double.tryParse(subtotalText.replaceAll(',', '.')) ?? 0.0;

    if (subtotal <= 0) {
      setState(() {
        resultText = 'Ingrese un subtotal válido';
      });
      return;
    }

    const ivaRate = 0.12;
    final iva = subtotal * ivaRate;
    final total = subtotal + iva;

    setState(() {
      resultText =
        'Subtotal: \$${subtotal.toStringAsFixed(2)}\n'
        'IVA (12%): \$${iva.toStringAsFixed(2)}\n'
        'Total a pagar: \$${total.toStringAsFixed(2)}';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Total con IVA'),
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
              'Calcular total de la cuenta',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),

            TextField(
              decoration: const InputDecoration(
                labelText: 'Subtotal (\$)',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                subtotalText = value;
              },
            ),

            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: calculateTotal,
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
