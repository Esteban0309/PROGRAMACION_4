import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class QuickDiagnosisPage extends StatefulWidget {
  const QuickDiagnosisPage({super.key});

  @override
  State<QuickDiagnosisPage> createState() => _QuickDiagnosisPageState();
}

class _QuickDiagnosisPageState extends State<QuickDiagnosisPage> {
  String selectedSymptom = 'Vibración al frenar';
  String kilometersText = '';
  String resultText = '';


  final Map<String, String> symptomDiagnosis = {
    'Vibración al frenar': 'Problema con los frenos.',
    'Humo azul del escape': 'Posible fuga de aceite.',
    'Ralentí inestable': 'Posibles problemas con el sistema de combustible o encendido.',
    'Ruido metálico al arrancar': 'Desgaste de partes del motor o sistema de arranque.'
  };

  void calculateDiagnosis() {
    final kilometers = int.tryParse(kilometersText) ?? 0;

    if (kilometers <= 0) {
      setState(() {
        resultText = 'Por favor, ingresa un número válido de kilómetros.';
      });
      return;
    }

    
    String diagnosisSeverity;
    if (kilometers <= 5000) {
      diagnosisSeverity = 'Moderado';
    } else if (kilometers <= 15000) {
      diagnosisSeverity = 'Importante';
    } else {
      diagnosisSeverity = 'Crítico';
    }

    setState(() {
      resultText =
          'Síntoma: $selectedSymptom\n'
          'Kilómetros desde el último mantenimiento: $kilometers\n'
          'Diagnóstico: ${symptomDiagnosis[selectedSymptom]}\n'
          'Gravedad del problema: $diagnosisSeverity';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Diagnóstico Rápido'),
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
              'Diagnóstico Rápido',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),

           
            DropdownButton<String>(
              value: selectedSymptom,
              isExpanded: true,
              items: const [
                DropdownMenuItem(
                  value: 'Vibración al frenar',
                  child: Text('Vibración al frenar'),
                ),
                DropdownMenuItem(
                  value: 'Humo azul del escape',
                  child: Text('Humo azul del escape'),
                ),
                DropdownMenuItem(
                  value: 'Ralentí inestable',
                  child: Text('Ralentí inestable'),
                ),
                DropdownMenuItem(
                  value: 'Ruido metálico al arrancar',
                  child: Text('Ruido metálico al arrancar'),
                ),
              ],
              onChanged: (value) {
                if (value == null) return;
                setState(() {
                  selectedSymptom = value;
                });
              },
            ),

            const SizedBox(height: 16),

      
            TextField(
              decoration: const InputDecoration(
                labelText: 'Kilómetros desde el último mantenimiento',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                kilometersText = value;
              },
            ),

            const SizedBox(height: 16),

            ElevatedButton(
              onPressed: calculateDiagnosis,
              child: const Text('Ver diagnóstico'),
            ),

            const SizedBox(height: 16),

            Text(resultText),
          ],
        ),
      ),
    );
  }
}
