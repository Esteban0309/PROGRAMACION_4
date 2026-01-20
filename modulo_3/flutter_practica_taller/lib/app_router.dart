import 'package:go_router/go_router.dart';

import 'pages/workshop_home_page.dart';
import 'pages/labor_page.dart';
import 'pages/parts_page.dart';
import 'pages/service_package_page.dart';
import 'pages/AlignmentBalancePage.dart';
import 'pages/QuickDiagnosisPage.dart';


final GoRouter appRouter = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (_, __) => const WorkshopHomePage(),
    ),
    GoRoute(
      path: '/labor',
      builder: (_, __) => const LaborPage(),
    ),
    GoRoute(
      path: '/parts',
      builder: (_, __) => const PartsPage(),
    ),
    GoRoute(
      path: '/service',
      builder: (_, __) => const ServicePackagePage(),
    ),
    GoRoute(
      path: '/Aligment',
      builder: (_, __) => AlignmentBalancePage(),
    ),
    GoRoute(
      path: '/diagnostico',
      builder: (_, __) => QuickDiagnosisPage(),
    ),
  ],
);
