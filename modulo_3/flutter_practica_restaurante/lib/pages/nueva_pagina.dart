import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';


class NuevaPagina extends StatelessWidget {
  const NuevaPagina({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Nueva Página')),
      body: Center(child: Text('Contenido de la nueva página')),
    );
  }
}