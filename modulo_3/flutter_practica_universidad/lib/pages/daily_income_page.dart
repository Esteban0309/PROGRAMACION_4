import 'package:flutter/material.dart';

class DailyIncomePage extends StatefulWidget {
  const DailyIncomePage({super.key});

  @override
  State<DailyIncomePage> createState() => _DailyIncomePageState();
}

class _DailyIncomePageState extends State<DailyIncomePage> {
  String mesasCountText = '';
  int mesasCount = 0;
  List<TextEditingController> consumoControllers = [];
  double totalGeneral = 0;

  
  void _generarMesas() {
    final parsed = int.tryParse(mesasCountText) ?? 0;

    if (parsed <= 0 || parsed > 10) {
      setState(() {
        totalGeneral = 0;
        consumoControllers.clear();
      });
      return;
    }

    mesasCount = parsed;
    consumoControllers.clear();

    for (int i = 0; i < mesasCount; i++) {
      consumoControllers.add(TextEditingController());
    }

    setState(() {
      totalGeneral = 0;
    });
  }

  void _calcularVentas() {
    if (mesasCount == 0) {
      setState(() {
        totalGeneral = 0;
      });
      return;
    }

    double total = 0;

    for (int i = 0; i < mesasCount; i++) {
      final consumo = double.tryParse(consumoControllers[i].text.trim()) ?? 0;
      total += consumo;
    }

    setState(() {
      totalGeneral = total;
    });
  }

  
  String _obtenerClasificacion() {
    if (totalGeneral < 200) {
      return 'Día bueno';
    } else if (totalGeneral >= 200 && totalGeneral <= 500) {
      return 'Día muy bueno';
    } else {
      return 'Día excelente';
    }
  }

  @override
  void dispose() {
    for (final c in consumoControllers) {
      c.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Resumen de Ventas Diarias'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'Resumen de Ventas por Día',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 12),
              TextField(
                decoration: const InputDecoration(
                  labelText: 'Cantidad de servicios/rentas (1 - 10)',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  mesasCountText = value;
                },
              ),
              const SizedBox(height: 12),
              ElevatedButton(
                onPressed: _generarMesas,
                child: const Text('Generar servicios'),
              ),
              const SizedBox(height: 16),

              if (mesasCount > 0)
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: mesasCount,
                  itemBuilder: (context, index) {
                    return Card(
                      margin: const EdgeInsets.symmetric(vertical: 6),
                      child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: Row(
                          children: [
                            Expanded(
                              child: TextField(
                                controller: consumoControllers[index],
                                decoration: InputDecoration(
                                  labelText: 'Consumo servicio ${index + 1}',
                                  border: const OutlineInputBorder(),
                                ),
                                keyboardType: TextInputType.number,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),

              const SizedBox(height: 16),

              ElevatedButton(
                onPressed: _calcularVentas,
                child: const Text('Calcular Total'),
              ),
              const SizedBox(height: 16),

              Text('Total de ventas del día: \$${totalGeneral.toStringAsFixed(2)}'),
              Text('Clasificación: ${_obtenerClasificacion()}'),
            ],
          ),
        ),
      ),
    );
  }
}
