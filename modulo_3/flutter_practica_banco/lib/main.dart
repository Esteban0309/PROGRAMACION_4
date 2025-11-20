import 'package:flutter/material.dart';
import 'app_router.dart';

void main() {
  runApp(const BankMenuApp());
}

class BankMenuApp extends StatelessWidget {
  const BankMenuApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Banco - GoRouter',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: true,
      ),
      routerConfig: appRouter,
    );
  }
}
