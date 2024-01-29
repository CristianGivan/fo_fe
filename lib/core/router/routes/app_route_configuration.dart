import 'package:authentication/authentication.dart';
import 'package:flutter/material.dart';
import 'package:fo_fe/core/home/presentation/screens/home_screen.dart';
import 'package:fo_fe/core/router/routes/stateful_shell_route.dart';
import 'package:go_router/go_router.dart';

import '../../../features/organizer/organizer.dart';
import '../../../features/other/presentation/screens/other1.dart';
import '../../../features/other/presentation/screens/other2.dart';
import '../../../features/other/presentation/screens/other_screen.dart';
import '../../../features/practice/presentation/screens/games_screen.dart';
import '../../../features/practice/presentation/screens/practice_screen.dart';
import '../../../features/practice/presentation/screens/review_screen.dart';
import '../../../features/settings/presentation/screens/display.dart';
import '../../../features/settings/presentation/screens/settings_screen.dart';
import 'app_route_constants.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorAKey = GlobalKey<NavigatorState>(debugLabel: 'shellA');
final _shellNavigatorBKey = GlobalKey<NavigatorState>(debugLabel: 'shellB');
final _settingsShellNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'settings');
final _shellNavigatorCKey = GlobalKey<NavigatorState>(debugLabel: 'shellC');
final _shellNavigatorDKey = GlobalKey<NavigatorState>(debugLabel: 'shellD');

// https://github.com/flutter/packages/blob/main/packages/go_router/example/lib/stateful_shell_route.dart
class AppRouter {
  static GoRouter returnRouter() {
    GoRouter router = GoRouter(
      initialLocation: RouteCoreConstants.homeRoute,
      debugLogDiagnostics: true,
      routes: [
        StatefulShellRoute.indexedStack(
          builder: (context, state, navigationShell) {
            return ScaffoldWithNestedNavigation(
                navigationShell: navigationShell);
          },
          branches: [
            homeBranch(_rootNavigatorKey),
            settingsBranch(_settingsShellNavigatorKey),
            AuthenticationAppBranch.branch(_shellNavigatorAKey),
            OrganizerAppBranch.branch(_shellNavigatorBKey),
            practiceBranch(_shellNavigatorCKey),
            otherBranch(_shellNavigatorDKey),
          ],
        ),
      ],
    );
    return router;
  }

  static StatefulShellBranch homeBranch(
    GlobalKey<NavigatorState> navigatorKey,
  ) {
    return StatefulShellBranch(
      navigatorKey: navigatorKey,
      routes: [
        homeRoute(),
      ],
    );
  }

  static GoRoute homeRoute() {
    return GoRoute(
      name: RouteCoreConstants.homeRouteName,
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const HomeScreen();
      },
    );
  }

  static StatefulShellBranch settingsBranch(
    GlobalKey<NavigatorState> navigatorKey,
  ) {
    return StatefulShellBranch(
      navigatorKey: navigatorKey,
      routes: [
        settingsRoute(),
      ],
    );
  }

  static GoRoute settingsRoute() {
    return GoRoute(
      name: RouteCoreConstants.settingsRoute,
      path: RouteCoreConstants.settingsRoute,
      pageBuilder: (context, state) =>
          const NoTransitionPage(child: Settings()),
      routes: [
        GoRoute(
          name: RouteCoreConstants.settingsDisplayRoute,
          path: RouteCoreConstants.displayRouteName,
          builder: (context, state) => const DisplaySettings(),
        ),
      ],
    );
  }

  static StatefulShellBranch practiceBranch(
      GlobalKey<NavigatorState> navigatorKey) {
    return StatefulShellBranch(
      navigatorKey: navigatorKey,
      routes: [
        practiceRoute(),
      ],
    );
  }

  static GoRoute practiceRoute() {
    return GoRoute(
      name: RouteCoreConstants.practiceRoute,
      path: RouteCoreConstants.practiceRoute,
      pageBuilder: (context, state) => const NoTransitionPage(
        child: Practice(),
      ),
      routes: [
        GoRoute(
          name: RouteCoreConstants.practiceGamesRoute,
          path: RouteCoreConstants.gamesRouteName,
          builder: (context, state) => const Games(),
        ),
        GoRoute(
          name: RouteCoreConstants.practiceReviewRoute,
          path: RouteCoreConstants.reviewRouteName,
          builder: (context, state) {
            return const Review();
          },
        ),
      ],
    );
  }

  static StatefulShellBranch otherBranch(
      GlobalKey<NavigatorState> navigatorKey) {
    return StatefulShellBranch(
      navigatorKey: navigatorKey,
      routes: [
        otherRoute(),
      ],
    );
  }

  static GoRoute otherRoute() {
    return GoRoute(
      name: RouteCoreConstants.otherRoute,
      path: RouteCoreConstants.otherRoute,
      pageBuilder: (context, state) => const NoTransitionPage(
        child: Other(),
      ),
      routes: [
        GoRoute(
          name: RouteCoreConstants.otherOther1Route,
          path: RouteCoreConstants.other1RouteName,
          builder: (context, state) => const Other1(),
        ),
        GoRoute(
          name: RouteCoreConstants.otherOther2Route,
          path: RouteCoreConstants.other2RouteName,
          builder: (BuildContext context, GoRouterState state) {
            return const Other2();
          },
        ),
      ],
    );
  }
}
