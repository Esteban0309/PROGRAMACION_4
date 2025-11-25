import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AlignmentBalancePage extends StatefulWidget {
  const AlignmentBalancePage({super.key});

  @override
  State<AlignmentBalancePage> createState() => _AlignmentBalancePageState();
}

class _AlignmentBalancePageState extends State<AlignmentBalancePage> {
  String totalTiresText = '';  
  String vehicleType = 'Auto'; 
  String serviceType = 'Solo alineación';
  String resultText = '';

  
  final Map<String, double> vehicleRates = {
    'Auto': 10,
    'Camioneta': 15,
    'Camión': 25,
  };

  final Map<String, double> serviceRates = {
    'Solo alineación': 8,
    'Solo balanceo': 5,
    'Alineación y balanceo': 12,
  };

  
  void calculateServiceCost() {
    final totalTires = int.tryParse(totalTiresText) ?? 0;

    if (totalTires <= 0 || totalTires > 6) {
      setState(() {
        resultText = 'Ingrese un número válido de llantas (2-6)';
      });
      return;
    }

   
    double vehicleRate = vehicleRates[vehicleType] ?? 0;
    double serviceRate = serviceRates[serviceType] ?? 0;

    final totalServiceCost = vehicleRate + (serviceRate * totalTires);


    String workClassification;
    if (totalServiceCost < 50) {
      workClassification = 'Trabajo pequeño';
    } else if (totalServiceCost <= 100) {
      workClassification = 'Trabajo medio';
    } else {
      workClassification = 'Trabajo grande';
    }

    setState(() {
      resultText =
        'Tipo de vehículo: $vehicleType\n'
        'Tipo de servicio: $serviceType\n'
        'Total llantas: $totalTires\n'
        'Costo vehículo: \$${vehicleRate.toStringAsFixed(2)}\n'
        'Costo por llanta: \$${serviceRate.toStringAsFixed(2)}\n'
        'Costo total: \$${totalServiceCost.toStringAsFixed(2)}\n'
        'Clasificación: $workClassification';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Alineación y Balanceo'),
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
              'Alineación y Balanceo',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),

            
            TextField(
              decoration: const InputDecoration(
                labelText: 'Cantidad de llantas (2-6)',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                totalTiresText = value;
              },
            ),

            const SizedBox(height: 16),

            DropdownButton<String>(
              value: vehicleType,
              isExpanded: true,
              items: const [
                DropdownMenuItem(
                  value: 'Auto',
                  child: Text('Auto'),
                ),
                DropdownMenuItem(
                  value: 'Camioneta',
                  child: Text('Camioneta'),
                ),
                DropdownMenuItem(
                  value: 'Camión',
                  child: Text('Camión'),
                ),
              ],
              onChanged: (value) {
                if (value == null) return;
                setState(() {
                  vehicleType = value;
                });
              },
            ),

            const SizedBox(height: 16),

            DropdownButton<String>(
              value: serviceType,
              isExpanded: true,
              items: const [
                DropdownMenuItem(
                  value: 'Solo alineación',
                  child: Text('Solo alineación'),
                ),
                DropdownMenuItem(
                  value: 'Solo balanceo',
                  child: Text('Solo balanceo'),
                ),
                DropdownMenuItem(
                  value: 'Alineación y balanceo',
                  child: Text('Alineación y balanceo'),
                ),
              ],
              onChanged: (value) {
                if (value == null) return;
                setState(() {
                  serviceType = value;
                });
              },
            ),

            const SizedBox(height: 16),

            ElevatedButton(
              onPressed: calculateServiceCost,
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
