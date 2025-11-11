import 'package:flutter/material.dart';
import 'core/theme/app_theme.dart';
import 'core/theme/theme_controller.dart';
import 'core/state/app_state.dart';
import 'router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final theme = ThemeController();
  await theme.load();

  final app = AppState();

  final router = buildRouter(app: app, theme: theme);

  runApp(MyApp(theme: theme, app: app, routerConfig: router));
}

class MyApp extends StatelessWidget {
  final ThemeController theme;
  final AppState app;
  final RouterConfig<Object> routerConfig;
  const MyApp({super.key, required this.theme, required this.app, required this.routerConfig});

  @override
  Widget build(BuildContext context) {
    // Redibuja cuando tema o app cambien
    return AnimatedBuilder(
      animation: Listenable.merge([theme, app]),
      builder: (context, _) {
        return MaterialApp.router(
          title: 'Flutter — Shell + BottomNav',
          debugShowCheckedModeBanner: false,
          theme: AppTheme.light(),
          darkTheme: AppTheme.dark(),
          themeMode: theme.mode,
          routerConfig: routerConfig,
        );
      },
    );
  }
}