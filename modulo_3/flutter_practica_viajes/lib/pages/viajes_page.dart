import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: CotizarViaje()));
}

class CotizarViaje extends StatefulWidget {
  @override
  _CotizarViajeState createState() => _CotizarViajeState();
}

class _CotizarViajeState extends State<CotizarViaje> {
  final TextEditingController diasController = TextEditingController();
  final TextEditingController personasController = TextEditingController();
  final TextEditingController precioController = TextEditingController();

  String destino = 'Playa';
  String alojamiento = 'Hostal';
  bool incluirTours = false;
  bool incluirSeguro = false;

  double subtotal = 0;
  double recargos = 0;
  double total = 0;
  double precioPorPersona = 0;

  Map<String, double> recargoDestino = {
    'Playa': 0.05,
    'Montaña': 0.10,
    'Ciudad': 0.08,
  };

  Map<String, double> recargoAlojamiento = {
    'Hostal': 0.0,
    'Hotel 3 estrellas': 0.15,
    'Hotel 5 estrellas': 0.30,
  };

  void calcular() {
    int dias = int.tryParse(diasController.text) ?? 0;
    int personas = int.tryParse(personasController.text) ?? 0;
    double precioBase = double.tryParse(precioController.text) ?? 0;

    subtotal = dias * precioBase * personas;

    recargos = subtotal * recargoDestino[destino]! +
        subtotal * recargoAlojamiento[alojamiento]!;

    if (incluirTours) recargos += subtotal * 0.10;
    if (incluirSeguro) recargos += subtotal * 0.10;

    total = subtotal + recargos;
    precioPorPersona = personas > 0 ? total / personas : 0;

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Cotizar Viaje')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                controller: diasController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: 'Días de viaje'),
              ),
              TextField(
                controller: personasController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: 'Número de personas'),
              ),
              TextField(
                controller: precioController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: 'Precio por día'),
              ),
              SizedBox(height: 20),
              DropdownButton<String>(
                value: destino,
                items: ['Playa', 'Montaña', 'Ciudad']
                    .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                    .toList(),
                onChanged: (val) => setState(() => destino = val!),
              ),
              SizedBox(height: 10),
              Text('Alojamiento:'),
              Column(
                children: [
                  RadioListTile(
                    title: Text('Hostal'),
                    value: 'Hostal',
                    groupValue: alojamiento,
                    onChanged: (val) => setState(() => alojamiento = val!),
                  ),
                  RadioListTile(
                    title: Text('Hotel 3 estrellas'),
                    value: 'Hotel 3 estrellas',
                    groupValue: alojamiento,
                    onChanged: (val) => setState(() => alojamiento = val!),
                  ),
                  RadioListTile(
                    title: Text('Hotel 5 estrellas'),
                    value: 'Hotel 5 estrellas',
                    groupValue: alojamiento,
                    onChanged: (val) => setState(() => alojamiento = val!),
                  ),
                ],
              ),
              CheckboxListTile(
                title: Text('Incluir tours (+10%)'),
                value: incluirTours,
                onChanged: (val) => setState(() => incluirTours = val!),
              ),
              CheckboxListTile(
                title: Text('Incluir seguro (+10%)'),
                value: incluirSeguro,
                onChanged: (val) => setState(() => incluirSeguro = val!),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: calcular,
                child: Text('Calcular'),
              ),
              SizedBox(height: 20),
              Text('Subtotal: \$${subtotal.toStringAsFixed(2)}'),
              Text('Recargos: \$${recargos.toStringAsFixed(2)}'),
              Text('Total: \$${total.toStringAsFixed(2)}'),
              Text('Precio por persona: \$${precioPorPersona.toStringAsFixed(2)}'),
            ],
          ),
        ),
      ),
    );
  }
}