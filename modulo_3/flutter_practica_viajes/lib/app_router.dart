import 'package:go_router/go_router.dart';

import 'pages/travel_home_page.dart';
import 'pages/travel_plan_page.dart';
import 'pages/destination_image_page.dart';
import 'pages/promo_video_page.dart';
import 'pages/photo_carousel_page.dart';
import 'pages/video_carousel_page.dart';
import 'pages/viajes_page.dart';

final GoRouter appRouter = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (_, __) => const TravelHomePage(),
    ),
    GoRoute(
      path: '/plan',
      builder: (_, __) => const TravelPlanPage(),
    ),
    GoRoute(
      path: '/destination',
      builder: (_, __) => const DestinationImagePage(),
    ),
    GoRoute(
      path: '/promo-video',
      builder: (_, __) => const PromoVideoPage(),
    ),
    GoRoute(
      path: '/photos',
      builder: (_, __) => const PhotoCarouselPage(),
    ),
    GoRoute(
      path: '/videos',
      builder: (_, __) => const VideoCarouselPage(),
    ),
    GoRoute(
      path: '/cotizar',
      builder: (_, __) => CotizarViaje(),
    ),
  ],
);
