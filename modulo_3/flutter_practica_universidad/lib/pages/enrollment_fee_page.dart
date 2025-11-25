import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class EnrollmentFeePage extends StatefulWidget {
  const EnrollmentFeePage({super.key});

  @override
  State<EnrollmentFeePage> createState() => _EnrollmentFeePageState();
}

class _EnrollmentFeePageState extends State<EnrollmentFeePage> {
  String inscriptionText = '';
  String idCardText = '';
  String labFeeText = '';
  String resultText = '';

  void calculateFees() {
    final inscription = double.tryParse(inscriptionText.replaceAll(',', '.')) ?? 0.0;
    final idCard = double.tryParse(idCardText.replaceAll(',', '.')) ?? 0.0;
    final labFee = double.tryParse(labFeeText.replaceAll(',', '.')) ?? 0.0;

    if (inscription < 0 || idCard < 0 || labFee < 0) {
      setState(() {
        resultText = 'Los valores no pueden ser negativos';
      });
      return;
    }

    final total = inscription + idCard + labFee;

    setState(() {
      resultText =
        'Inscripción: \$${inscription.toStringAsFixed(2)}\n'
        'Carnet estudiantil: \$${idCard.toStringAsFixed(2)}\n'
        'Laboratorio: \$${labFee.toStringAsFixed(2)}\n'
        'Total derechos de inscripción: \$${total.toStringAsFixed(2)}';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Derechos de inscripción'),
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
                'Cálculo de derechos de inscripción',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),

              TextField(
                decoration: const InputDecoration(
                  labelText: 'Inscripción (\$)',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  inscriptionText = value;
                },
              ),

              const SizedBox(height: 16),

              TextField(
                decoration: const InputDecoration(
                  labelText: 'Carnet estudiantil (\$)',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  idCardText = value;
                },
              ),

              const SizedBox(height: 16),

              TextField(
                decoration: const InputDecoration(
                  labelText: 'Laboratorio (\$)',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  labFeeText = value;
                },
              ),

              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: calculateFees,
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
