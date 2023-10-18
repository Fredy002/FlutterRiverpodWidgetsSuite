// ignore_for_file: file_names

import 'package:go_router/go_router.dart';
import 'package:widgets_app/src/screens/screens.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
  GoRoute(
    path: '/',
    builder: (context, state) => const HomeScreen(),
  ),
  GoRoute(
    path: '/buttons',
    builder: (context, state) => const ButtonsScreen(),
  ),
  GoRoute(
    path: '/cards',
    builder: (context, state) => const CardsScreen(),
  )
]);
