import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CreditsSummaryPage extends StatefulWidget {
  const CreditsSummaryPage({super.key});

  @override
  State<CreditsSummaryPage> createState() => _CreditsSummaryPageState();
}

class _CreditsSummaryPageState extends State<CreditsSummaryPage> {
  String subjectsCountText = '';
  int subjectsCount = 0;

  final List<TextEditingController> subjectNameControllers = [];
  final List<TextEditingController> creditsControllers = [];

  String resultText = '';

  void _generateSubjects() {
    final parsed = int.tryParse(subjectsCountText) ?? 0;

    if (parsed <= 0 || parsed > 8) {
      setState(() {
        resultText = 'Ingrese una cantidad de materias entre 1 y 8';
        subjectsCount = 0;
        subjectNameControllers.clear();
        creditsControllers.clear();
      });
      return;
    }

    subjectsCount = parsed;
    subjectNameControllers.clear();
    creditsControllers.clear();

    for (int i = 0; i < subjectsCount; i++) {
      subjectNameControllers.add(TextEditingController());
      creditsControllers.add(TextEditingController());
    }

    setState(() {
      resultText = 'Ingrese nombre y créditos para cada materia.';
    });
  }

  void _calculateCredits() {
    if (subjectsCount == 0) {
      setState(() {
        resultText = 'Primero indique cuántas materias tiene y genere el formulario.';
      });
      return;
    }

    int totalCredits = 0;
    final List<String> lines = [];

    for (int i = 0; i < subjectsCount; i++) {
      final name = subjectNameControllers[i].text.trim().isEmpty
          ? 'Materia ${i + 1}'
          : subjectNameControllers[i].text.trim();

      final credits = int.tryParse(
            creditsControllers[i].text.trim(),
          ) ??
          0;

      totalCredits += credits;
      lines.add('- $name: $credits créditos');
    }

    String loadType;
    if (totalCredits < 12) {
      loadType = 'Carga ligera';
    } else if (totalCredits <= 20) {
      loadType = 'Carga normal';
    } else {
      loadType = 'Carga pesada';
    }

    setState(() {
      resultText =
        'Materias registradas:\n'
        '${lines.join('\n')}\n\n'
        'Total de créditos: $totalCredits\n'
        'Tipo de carga: $loadType';
    });
  }

  @override
  void dispose() {
    for (final c in subjectNameControllers) {
      c.dispose();
    }
    for (final c in creditsControllers) {
      c.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sumatoria de créditos'),
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
                'Créditos por semestre',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 12),

              TextField(
                decoration: const InputDecoration(
                  labelText: 'Cantidad de materias (1 - 8)',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  subjectsCountText = value;
                },
              ),

              const SizedBox(height: 12),
              ElevatedButton(
                onPressed: _generateSubjects,
                child: const Text('Generar materias'),
              ),

              const SizedBox(height: 16),

              if (subjectsCount > 0)
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: subjectsCount,
                  itemBuilder: (context, index) {
                    return Card(
                      margin: const EdgeInsets.symmetric(vertical: 6),
                      child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 2,
                              child: TextField(
                                controller: subjectNameControllers[index],
                                decoration: InputDecoration(
                                  labelText: 'Materia ${index + 1}',
                                  border: const OutlineInputBorder(),
                                ),
                              ),
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              child: TextField(
                                controller: creditsControllers[index],
                                decoration: const InputDecoration(
                                  labelText: 'Créditos',
                                  border: OutlineInputBorder(),
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
              if (subjectsCount > 0)
                ElevatedButton(
                  onPressed: _calculateCredits,
                  child: const Text('Calcular créditos totales'),
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
