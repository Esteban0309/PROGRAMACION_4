import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppointmentCostPage extends StatefulWidget {
  const AppointmentCostPage({super.key});

  @override
  State<AppointmentCostPage> createState() => _AppointmentCostPageState();
}

class _AppointmentCostPageState extends State<AppointmentCostPage> {
  String patientType = 'Particular';
  String baseCostText = '';
  String resultText = '';

  void calculateCost() {
    final baseCost = double.tryParse(baseCostText.replaceAll(',', '.')) ?? 0.0;

    if (baseCost <= 0) {
      setState(() {
        resultText = 'Ingrese un costo base válido';
      });
      return;
    }

    double discount = 0;

    if (patientType == 'Particular') {
      discount = 0;
    } else if (patientType == 'Seguro público') {
      discount = 30;
    } else if (patientType == 'Seguro privado') {
      discount = 40;
    }

    final discountAmount = baseCost * discount / 100;
    final finalCost = baseCost - discountAmount;

    setState(() {
      resultText =
        'Tipo de paciente: $patientType\n'
        'Descuento: ${discount.toStringAsFixed(0)} %\n'
        'Monto de descuento: \$${discountAmount.toStringAsFixed(2)}\n'
        'Costo final: \$${finalCost.toStringAsFixed(2)}';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Costo de cita'),
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
              'Costo de cita según cobertura',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),

            DropdownButton<String>(
              value: patientType,
              isExpanded: true,
              items: const [
                DropdownMenuItem(
                  value: 'Particular',
                  child: Text('Paciente particular'),
                ),
                DropdownMenuItem(
                  value: 'Seguro público',
                  child: Text('Paciente con seguro público'),
                ),
                DropdownMenuItem(
                  value: 'Seguro privado',
                  child: Text('Paciente con seguro privado'),
                ),
              ],
              onChanged: (value) {
                if (value == null) return;
                setState(() {
                  patientType = value;
                });
              },
            ),

            const SizedBox(height: 16),
            TextField(
              decoration: const InputDecoration(
                labelText: 'Costo base de la cita (\$)',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                baseCostText = value;
              },
            ),

            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: calculateCost,
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
