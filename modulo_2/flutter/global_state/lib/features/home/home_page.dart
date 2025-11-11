import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../core/state/app_state.dart';

class HomePage extends StatelessWidget {
  final AppState app;
  const HomePage({super.key, required this.app});

  @override
  Widget build(BuildContext context) {
    final items = List.generate(5, (i) => i + 1);

    return ListView.separated(
      padding: const EdgeInsets.all(16),
      itemCount: items.length + 1,
      separatorBuilder: (_, __) => const SizedBox(height: 8),
      itemBuilder: (_, i) {
        if (i == 0) {
          return Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Contador global: ${app.count}', style: const TextStyle(fontSize: 16)),
                  Row(
                    children: [
                      FilledButton(onPressed: app.inc, child: const Text('+1')),
                      const SizedBox(width: 8),
                      OutlinedButton(onPressed: app.reset, child: const Text('Reset')),
                    ],
                  )
                ],
              ),
            ),
          );
        }
        final id = items[i - 1];
        return Card(
          child: ListTile(
            title: Text('Elemento #$id'),
            subtitle: const Text('Toca para ver detalle'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => context.go('/home/detail/$id'),
          ),
        );
      },
    );
  }
}