import 'package:flutter/material.dart';

class CalculadorPropinaPage extends StatefulWidget {
  const CalculadorPropinaPage({super.key});

  @override
  State<CalculadorPropinaPage> createState() => _CalculadorPropinaPageState();
}

class _CalculadorPropinaPageState extends State<CalculadorPropinaPage> {
  String mesasCountText = '';
  int mesasCount = 0;
  List<TextEditingController> consumoControllers = [];
  double totalPropina = 0;
  double totalGeneral = 0;
  double porcentajePropina = 10;

  void _generarMesas() {
    final parsed = int.tryParse(mesasCountText) ?? 0;

    if (parsed <= 0 || parsed > 10) {
      setState(() {
        totalPropina = 0;
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
      totalPropina = 0;
      totalGeneral = 0;
    });
  }

  void _calcularPropina() {
    if (mesasCount == 0) {
      setState(() {
        totalPropina = 0;
        totalGeneral = 0;
      });
      return;
    }

    double total = 0;
    double propina = 0;

    for (int i = 0; i < mesasCount; i++) {
      final consumo = double.tryParse(consumoControllers[i].text.trim()) ?? 0;
      total += consumo;
      propina += consumo * porcentajePropina / 100;
    }

    setState(() {
      totalPropina = propina;
      totalGeneral = total + totalPropina;
    });
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
        title: const Text('Calculadora de Propinas'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'Calculadora de Propinas por Mesa',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 12),
              TextField(
                decoration: const InputDecoration(
                  labelText: 'Cantidad de mesas (1 - 10)',
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
                child: const Text('Generar mesas'),
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
                                  labelText: 'Consumo mesa ${index + 1}',
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

              DropdownButton<double>(
                value: porcentajePropina,
                items: const [
                  DropdownMenuItem(value: 10, child: Text('10%')),
                  DropdownMenuItem(value: 12, child: Text('12%')),
                  DropdownMenuItem(value: 15, child: Text('15%')),
                ],
                onChanged: (value) {
                  setState(() {
                    porcentajePropina = value!;
                  });
                },
              ),

              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: _calcularPropina,
                child: const Text('Calcular Propina'),
              ),
              const SizedBox(height: 16),

              Text('Total de Propina: \$${totalPropina.toStringAsFixed(2)}'),
              Text('Total General: \$${totalGeneral.toStringAsFixed(2)}'),
            ],
          ),
        ),
      ),
    );
  }
}
