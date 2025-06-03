part of 'route_import_part.dart';

class RouteConfig {
  GoRouter goRouter = GoRouter(
    initialLocation: RouteName.initialRoute,
    routes: [
      GoRoute(
        name: RouteName.initialRoute,
        path: RouteName.initialRoute,
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        name: RouteName.homeScreen,
        path: RouteName.homeScreen,
        builder: (context, state) => const HomeScreen(),
      ),
    ],
  );
}
