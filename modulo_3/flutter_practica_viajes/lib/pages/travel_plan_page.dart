import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class TravelPlanPage extends StatefulWidget {
  const TravelPlanPage({super.key});

  @override
  State<TravelPlanPage> createState() => _TravelPlanPageState();
}

class _TravelPlanPageState extends State<TravelPlanPage> {
  // TextFields
  String daysText = '';
  String peopleText = '';
  String basePriceText = '';

  // Dropdown destino
  String destination = 'Playa';

  // Radio alojamiento
  String lodging = 'Hostal'; // Hostal, Hotel 3★, Hotel 5★

  // Checkboxes
  bool includeTours = false;
  bool includeInsurance = false;

  String resultText = '';

  void calculatePackage() {
    final days = int.tryParse(daysText) ?? 0;
    final people = int.tryParse(peopleText) ?? 0;
    final basePrice = double.tryParse(basePriceText.replaceAll(',', '.')) ?? 0.0;

    if (days <= 0 || people <= 0 || basePrice <= 0) {
      setState(() {
        resultText = 'Ingrese días, personas y precio base válidos';
      });
      return;
    }

    double destinationFactor = 0; // porcentaje extra
    if (destination == 'Playa') {
      destinationFactor = 10; // +10%
    } else if (destination == 'Montaña') {
      destinationFactor = 5; // +5%
    } else if (destination == 'Ciudad') {
      destinationFactor = 8; // +8%
    }

    double lodgingFactor = 0;
    if (lodging == 'Hostal') {
      lodgingFactor = 0; // 0%
    } else if (lodging == 'Hotel 3★') {
      lodgingFactor = 15;
    } else if (lodging == 'Hotel 5★') {
      lodgingFactor = 30;
    }

    // Precio base total por día y persona
    final baseTotal = basePrice * days * people;

    // Se aplican recargos porcentuales sobre el baseTotal
    final destinationExtra = baseTotal * (destinationFactor / 100);
    final lodgingExtra = baseTotal * (lodgingFactor / 100);

    double subtotal = baseTotal + destinationExtra + lodgingExtra;

    if (includeTours) {
      subtotal += subtotal * 0.10; // +10%
    }
    if (includeInsurance) {
      subtotal += subtotal * 0.05; // +5%
    }

    final pricePerPerson = subtotal / people;

    setState(() {
      resultText =
        'Destino: $destination\n'
        'Alojamiento: $lodging\n'
        'Tours incluidos: ${includeTours ? "Sí" : "No"}\n'
        'Seguro de viaje: ${includeInsurance ? "Sí" : "No"}\n'
        'Días: $days, Personas: $people\n'
        'Costo total del paquete: \$${subtotal.toStringAsFixed(2)}\n'
        'Costo por persona: \$${pricePerPerson.toStringAsFixed(2)}';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Paquete de viaje'),
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
                'Configurar paquete de viaje',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),

              TextField(
                decoration: const InputDecoration(
                  labelText: 'Días de viaje',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                onChanged: (value) => daysText = value,
              ),
              const SizedBox(height: 16),

              TextField(
                decoration: const InputDecoration(
                  labelText: 'Número de personas',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                onChanged: (value) => peopleText = value,
              ),
              const SizedBox(height: 16),

              TextField(
                decoration: const InputDecoration(
                  labelText: 'Precio base por día y persona (\$)',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                onChanged: (value) => basePriceText = value,
              ),
              const SizedBox(height: 16),

              const Text('Destino'),
              DropdownButton<String>(
                value: destination,
                isExpanded: true,
                items: const [
                  DropdownMenuItem(
                    value: 'Playa',
                    child: Text('Playa'),
                  ),
                  DropdownMenuItem(
                    value: 'Montaña',
                    child: Text('Montaña'),
                  ),
                  DropdownMenuItem(
                    value: 'Ciudad',
                    child: Text('Ciudad'),
                  ),
                ],
                onChanged: (value) {
                  if (value == null) return;
                  setState(() {
                    destination = value;
                  });
                },
              ),

              const SizedBox(height: 16),
              const Text('Tipo de alojamiento'),

              RadioListTile<String>(
                title: const Text('Hostal'),
                value: 'Hostal',
                groupValue: lodging,
                onChanged: (value) {
                  if (value == null) return;
                  setState(() => lodging = value);
                },
              ),
              RadioListTile<String>(
                title: const Text('Hotel 3★'),
                value: 'Hotel 3★',
                groupValue: lodging,
                onChanged: (value) {
                  if (value == null) return;
                  setState(() => lodging = value);
                },
              ),
              RadioListTile<String>(
                title: const Text('Hotel 5★'),
                value: 'Hotel 5★',
                groupValue: lodging,
                onChanged: (value) {
                  if (value == null) return;
                  setState(() => lodging = value);
                },
              ),

              CheckboxListTile(
                title: const Text('Incluir tours (+10%)'),
                value: includeTours,
                onChanged: (value) {
                  setState(() {
                    includeTours = value ?? false;
                  });
                },
              ),
              CheckboxListTile(
                title: const Text('Incluir seguro de viaje (+5%)'),
                value: includeInsurance,
                onChanged: (value) {
                  setState(() {
                    includeInsurance = value ?? false;
                  });
                },
              ),

              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: calculatePackage,
                child: const Text('Calcular paquete'),
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
