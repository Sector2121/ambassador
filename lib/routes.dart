import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ambassador/index.dart';

GoRouter? _router;
final _appShellNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'AppShellRouteNavigatorKey');
final _loginShellNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'LoginShellRouteNavigatorKey');

GoRouter createRouterConfig() {
  _router ??= GoRouter(
    initialLocation: '/${NavigationRoutes.email}',
    routes: [
      ShellRoute(
        navigatorKey: _appShellNavigatorKey,
        builder: (context, state, widget) => AppShellPage(
          child: widget,
        ),
        routes: [
          ShellRoute(
            navigatorKey: _loginShellNavigatorKey,
            builder: (context, state, widget) => LoginShellPage(
                child: widget,
              ),
            routes: [
              GoRoute(
                name: NavigationRoutes.email,
                path: '/${NavigationRoutes.email}',
                builder: (context, state) => EmailPage(),
              ),
              GoRoute(
                name: NavigationRoutes.password,
                path: '/${NavigationRoutes.password}',
                pageBuilder: (context, state) {
                  return CustomTransitionPage(
                    key: state.pageKey,
                    child: const PasswordPage(),
                    transitionsBuilder: (context, animation, secondaryAnimation, child) {
                      return SlideTransition(
                        position: animation.drive(
                          Tween<Offset>(
                            begin: const Offset(0.5, 0),
                            end: Offset.zero,
                          ).chain(CurveTween(curve: Curves.easeIn)),
                        ),
                        child: child,
                      );
                    },
                  );
                },
              ),
            ],
          ),
          GoRoute(
            name: NavigationRoutes.scoreboard,
            path: '/${NavigationRoutes.scoreboard}',
            builder: (context, state) => ScoreBoardPage(),
          ),
        ],
      ),
    ],
  );

  return _router!;
}
