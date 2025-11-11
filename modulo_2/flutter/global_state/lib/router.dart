import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'core/state/app_state.dart';
import 'core/theme/theme_controller.dart';
import 'features/home/home_page.dart';
import 'features/home/detail_page.dart';
import 'features/settings/settings_page.dart';
import 'features/profile/profile_page.dart';
import 'shell_scaffold.dart';

GoRouter buildRouter({
  required AppState app,
  required ThemeController theme,
}) {
  return GoRouter(
    initialLocation: '/home',
    refreshListenable: Listenable.merge([theme, app]),
    routes: [
      ShellRoute(
        builder: (context, state, child) {
          return ShellScaffold(
            child: child,
            app: app,
            theme: theme,
            location: state.uri.toString(),
          );
        },
        routes: [
          GoRoute(
            path: '/home',
            builder: (context, state) => HomePage(app: app),
            routes: [
              GoRoute(
                path: 'detail/:id',
                builder: (context, state) {
                  final id = state.pathParameters['id'] ?? '—';
                  return DetailPage(id: id);
                },
              ),
            ],
          ),
          GoRoute(
            path: '/settings',
            builder: (context, state) => SettingsPage(theme: theme),
          ),
          GoRoute(
            path: '/profile',
            builder: (context, state) => ProfilePage(app: app),
          ),
        ],
      ),
    ],
  );
}