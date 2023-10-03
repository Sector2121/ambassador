import 'package:go_router/go_router.dart';
import 'package:ambassador/index.dart';

GoRouter? _router;

GoRouter createRouterConfig() {
  _router ??= GoRouter(
    initialLocation:'/${NavigationRoutes.email}',
    routes: [
      GoRoute(
        name: NavigationRoutes.email,
        path: '/${NavigationRoutes.email}',
        builder: (context, state) => EmailPage(),
      ),
      GoRoute(
        name: NavigationRoutes.password,
        path: '/${NavigationRoutes.password}',
        builder: (context, state) => PasswordPage(),
      ),
      GoRoute(
        name: NavigationRoutes.scoreboard,
        path: '/${NavigationRoutes.scoreboard}',
        builder: (context, state) => EmailPage(),
      ),
    ],
  );

  return _router!;
}
