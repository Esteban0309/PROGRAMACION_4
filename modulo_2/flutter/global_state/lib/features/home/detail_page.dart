import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  final String id;
  const DetailPage({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Detalle $id')),
      body: Center(
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Text('Mostrando detalle del elemento #$id', style: const TextStyle(fontSize: 18)),
          ),
        ),
      ),
    );
  }
}