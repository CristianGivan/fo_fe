import 'package:authentication/authentication.dart';
import 'package:flutter/material.dart';
import 'package:fo_fe/core/router/routes/home_router.dart';
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
import 'stateful_shell_route.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorAKey = GlobalKey<NavigatorState>(debugLabel: 'shellA');
final _organizerShellNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'organizer');
final _settingsShellNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'settings');
final _shellNavigatorCKey = GlobalKey<NavigatorState>(debugLabel: 'shellC');
final _shellNavigatorDKey = GlobalKey<NavigatorState>(debugLabel: 'shellD');

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
            HomeAppBranch.branch(_rootNavigatorKey),
            settingsBranch(_settingsShellNavigatorKey),
            AuthenticationAppBranch.branch(_shellNavigatorAKey),
            OrganizerAppBranch.branch(_organizerShellNavigatorKey),
            practiceBranch(_shellNavigatorCKey),
            otherBranch(_shellNavigatorDKey),
          ],
        ),
      ],
    );
    return router;
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
          const NoTransitionPage(child: SettingsScreenm()),
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
        child: PracticeScreen(),
      ),
      routes: [
        GoRoute(
          name: RouteCoreConstants.practiceGamesRoute,
          path: RouteCoreConstants.gamesRouteName,
          builder: (context, state) => const GamesScreen(),
        ),
        GoRoute(
          name: RouteCoreConstants.practiceReviewRoute,
          path: RouteCoreConstants.reviewRouteName,
          builder: (context, state) {
            return const ReviewScreen();
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
        child: OtherScreen(),
      ),
      routes: [
        GoRoute(
          name: RouteCoreConstants.otherOther1Route,
          path: RouteCoreConstants.other1RouteName,
          builder: (context, state) => const Other1Screen(),
        ),
        GoRoute(
          name: RouteCoreConstants.otherOther2Route,
          path: RouteCoreConstants.other2RouteName,
          builder: (BuildContext context, GoRouterState state) {
            return const Other2Screen();
          },
        ),
      ],
    );
  }
}
