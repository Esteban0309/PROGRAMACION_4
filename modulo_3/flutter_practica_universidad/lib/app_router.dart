import 'package:go_router/go_router.dart';

import 'pages/admissions_home_page.dart';
import 'pages/average_grade_page.dart';
import 'pages/tuition_page.dart';
import 'pages/enrollment_fee_page.dart';
import 'pages/credits_summary_page.dart';
import 'pages/calculadorpropinapage.dart';
import 'pages/daily_income_page.dart';

final GoRouter appRouter = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (_, __) => const AdmissionsHomePage(),
    ),
    GoRoute(
      path: '/average',
      builder: (_, __) => const AverageGradePage(),
    ),
    GoRoute(
      path: '/tuition',
      builder: (_, __) => const TuitionPage(),
    ),
    GoRoute(
      path: '/fees',
      builder: (_, __) => const EnrollmentFeePage(),
    ),
    GoRoute(
      path: '/credits',
      builder: (_, __) => const CreditsSummaryPage(),
    ),
    GoRoute(
      path: '/propina',
      builder: (_, __) => CalculadorPropinaPage (),
    ),
    GoRoute(
      path: '/services',
      builder: (_, __) => DailyIncomePage (),
    ),
  ],
);
