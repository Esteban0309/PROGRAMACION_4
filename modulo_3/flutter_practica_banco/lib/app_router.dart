import 'package:go_router/go_router.dart';

import 'pages/bank_home_page.dart';
import 'pages/interest_page.dart';
import 'pages/loan_page.dart';
import 'pages/atm_fee_page.dart';

final GoRouter appRouter = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (_, __) => const BankHomePage(),
    ),
    GoRoute(
      path: '/interest',
      builder: (_, __) => const InterestPage(),
    ),
    GoRoute(
      path: '/loan',
      builder: (_, __) => const LoanPage(),
    ),
    GoRoute(
      path: '/atm',
      builder: (_, __) => const AtmFeePage(),
    ),
  ],
);
