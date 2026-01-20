import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CostoHos extends StatefulWidget {
  const CostoHos({super.key});

  @override
  State<CostoHos> createState() => _CostoHosState();
}

class _CostoHosState extends State<CostoHos> {
  String roomType = 'General';
  String insuranceType = 'Sin seguro';
  String daysText = '';
  String baseCostText = '';
  String resultText = '';

  // Método para calcular el costo
  void calculateCost() {
    final days = int.tryParse(daysText) ?? 0;
    final baseCost = double.tryParse(baseCostText.replaceAll(',', '.')) ?? 0.0;

    // Verificar que los valores sean válidos
    if (days <= 0 || baseCost <= 0) {
      setState(() {
        resultText = 'Por favor ingrese valores válidos para los días y el costo base.';
      });
      return;
    }

    // Factores por tipo de habitación
    double roomFactor = 1.0;
    if (roomType == 'Semi-privada') {
      roomFactor = 1.4;
    } else if (roomType == 'Privada') {
      roomFactor = 2.0;
    }

    // Descuento por tipo de seguro
    double insuranceDiscount = 0;
    if (insuranceType == 'Seguro público') {
      insuranceDiscount = 0.30;
    } else if (insuranceType == 'Seguro privado') {
      insuranceDiscount = 0.50;
    }

    // Cálculo del costo diario y total
    final dailyCost = baseCost * roomFactor;
    final totalCostBeforeDiscount = dailyCost * days;
    final discountAmount = totalCostBeforeDiscount * insuranceDiscount;
    final totalCost = totalCostBeforeDiscount - discountAmount;

    // Mostrar los resultados
    setState(() {
      resultText = '''
      Tipo de habitación: $roomType
      Tipo de seguro: $insuranceType
      Costo diario: \$${dailyCost.toStringAsFixed(2)}
      Costo total antes de descuento: \$${totalCostBeforeDiscount.toStringAsFixed(2)}
      Descuento aplicado: \$${discountAmount.toStringAsFixed(2)}
      Costo total: \$${totalCost.toStringAsFixed(2)}
      ''';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Costo de hospitalización'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.go('/'),
        ),
      ),
      body: SingleChildScrollView(  // Aquí hemos agregado SingleChildScrollView
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Calcular costo de hospitalización',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            // Selector de tipo de habitación
            DropdownButton<String>(
              value: roomType,
              isExpanded: true,
              items: const [
                DropdownMenuItem(value: 'General', child: Text('Habitación General')),
                DropdownMenuItem(value: 'Semi-privada', child: Text('Habitación Semi-privada')),
                DropdownMenuItem(value: 'Privada', child: Text('Habitación Privada')),
              ],
              onChanged: (value) {
                if (value != null) {
                  setState(() {
                    roomType = value;
                  });
                }
              },
            ),
            const SizedBox(height: 16),
            // Selector de tipo de seguro
            DropdownButton<String>(
              value: insuranceType,
              isExpanded: true,
              items: const [
                DropdownMenuItem(value: 'Sin seguro', child: Text('Sin seguro')),
                DropdownMenuItem(value: 'Seguro público', child: Text('Seguro público')),
                DropdownMenuItem(value: 'Seguro privado', child: Text('Seguro privado')),
              ],
              onChanged: (value) {
                if (value != null) {
                  setState(() {
                    insuranceType = value;
                  });
                }
              },
            ),
            const SizedBox(height: 16),
            // Campo para ingresar los días de hospitalización
            TextField(
              decoration: const InputDecoration(
                labelText: 'Días de hospitalización',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                daysText = value;
              },
            ),
            const SizedBox(height: 16),
            // Campo para ingresar el costo base
            TextField(
              decoration: const InputDecoration(
                labelText: 'Costo base de la hospitalización (\$)',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                baseCostText = value;
              },
            ),
            const SizedBox(height: 16),
            // Botón para calcular el costo
            ElevatedButton(
              onPressed: calculateCost,
              child: const Text('Calcular'),
            ),
            const SizedBox(height: 16),
            // Mostrar los resultados
            Text(resultText),
          ],
        ),
      ),
    );
  }
}
