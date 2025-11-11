import 'package:flutter/material.dart';
import '../../core/state/app_state.dart';

class ProfilePage extends StatelessWidget {
  final AppState app;
  const ProfilePage({super.key, required this.app});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Text('Perfil — contador global actual: ${app.count}',
              style: const TextStyle(fontSize: 18)),
        ),
      ),
    );
  }
}