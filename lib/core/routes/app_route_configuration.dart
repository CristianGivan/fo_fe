import 'package:flutter/material.dart';
import 'package:fo_fe/core/routes/stateful_shell_route.dart';
import 'package:go_router/go_router.dart';
import '../../features/fo/reminders/screens/reminders_screen.dart';
import '../../features/fo/tasks/screens/tasks_screen.dart';
import '../../features/fo/topics/screens/topics_screen.dart';
import '../../features/login/screens/login_screen.dart';
import '../../features/login/screens/register_screen.dart';
import '../../features/other/other1/screens/other1.dart';
import '../../features/other/other2/screens/other2.dart';
import '../../features/practice/games/screens/games_screen.dart';
import '../../features/practice/review/screens/review_screen.dart';
import '../../features/settings/screens/display.dart';
import '../screens/fo_screen.dart';
import '../screens/home_screen.dart';
import '../screens/other_screen.dart';
import '../screens/practice_screen.dart';
import '../screens/settings_screen.dart';
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
  static GoRouter returnRouter(bool isAuth) {
    GoRouter router = GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: true,
      routes: [
        StatefulShellRoute.indexedStack(
          builder: (context, state, navigationShell) {
            return ScaffoldWithNestedNavigation(
                navigationShell: navigationShell);
          },
          branches: [
            homeBranch(_rootNavigatorKey, isAuth),
            settingsBranch(_settingsShellNavigatorKey, isAuth),
            foAppBranch(_shellNavigatorBKey, isAuth),
            loginBranch(_shellNavigatorAKey, isAuth),
            practiceBranch(_shellNavigatorCKey, isAuth),
            otherBranch(_shellNavigatorDKey, isAuth),
          ],
        ),
      ],
    );
    return router;
  }

  static StatefulShellBranch homeBranch(
    GlobalKey<NavigatorState> navigatorKey,
    bool isAuth,
  ) {
    return StatefulShellBranch(
      navigatorKey: navigatorKey,
      routes: [
        homeRoute(isAuth),
      ],
    );
  }

  static GoRoute homeRoute(bool isAuth) {
    return GoRoute(
      name: RouteConstants.homeRouteName,
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const Home();
      },
    );
  }

  static StatefulShellBranch settingsBranch(
    GlobalKey<NavigatorState> navigatorKey,
    bool isAuth,
  ) {
    return StatefulShellBranch(
      navigatorKey: navigatorKey,
      routes: [
        settingsRoute(isAuth),
      ],
    );
  }

  static GoRoute settingsRoute(bool isAuth) {
    return GoRoute(
      name: RouteConstants.settingsRouteName,
      path: RouteConstants.settingsRouteName,
      pageBuilder: (context, state) =>
          const NoTransitionPage(child: Settings()),
      routes: [
        GoRoute(
          name: RouteConstants.settingsDisplayRouteName,
          path: RouteConstants.displayRouteName,
          builder: (context, state) => const DisplaySettings(),
        ),
      ],
    );
  }

  static StatefulShellBranch loginBranch(
    GlobalKey<NavigatorState> navigatorKey,
    bool isAuth,
  ) {
    return StatefulShellBranch(
      navigatorKey: navigatorKey,
      routes: [
        loginRoute(isAuth),
      ],
    );
  }

  static GoRoute loginRoute(bool isAuth) {
    return GoRoute(
      name: RouteConstants.loginRouteName,
      path: RouteConstants.loginRouteName,
      pageBuilder: (context, state) => const NoTransitionPage(child: Login()),
      routes: [
        GoRoute(
          name: RouteConstants.loginRegisterRouteName,
          path: RouteConstants.registerRouteName,
          builder: (context, state) => const Register(),
        ),
      ],
    );
  }

  static StatefulShellBranch foAppBranch(
    GlobalKey<NavigatorState> navigatorKey,
    bool isAuth,
  ) {
    return StatefulShellBranch(
      navigatorKey: navigatorKey,
      routes: [
        foAppRoute(isAuth),
      ],
    );
  }

  static GoRoute foAppRoute(bool isAuth) {
    return GoRoute(
        name: RouteConstants.foRouteName,
        path: '/fo',
        pageBuilder: (context, state) => const NoTransitionPage(
              child: FO(),
            ),
        routes: [
          GoRoute(
            name: RouteConstants.foTopicsRouteName,
            path: RouteConstants.topicRouteName,
            builder: (context, state) => const Topics(),
          ),
          GoRoute(
            name: RouteConstants.foTasksRouteName,
            path: RouteConstants.tasksRouteName,
            builder: (context, state) => const Tasks(),
          ),
          GoRoute(
            name: RouteConstants.foReminderRouteName,
            path: RouteConstants.reminderRouteName,
            builder: (context, state) => const Reminder(),
          ),
        ],
        redirect: (context, state) {
          if (isAuth) {
            return null;
          } else {
            return context.push(RouteConstants.loginRouteName);
            // .namedLocation(RouteConstants.homeRouteName);
          }
        });
  }

  static StatefulShellBranch practiceBranch(
      GlobalKey<NavigatorState> navigatorKey, bool isAuth) {
    return StatefulShellBranch(
      navigatorKey: navigatorKey,
      routes: [
        practiceRoute(isAuth),
      ],
    );
  }

  static GoRoute practiceRoute(bool isAuth) {
    return GoRoute(
      name: RouteConstants.practiceRouteName,
      path: RouteConstants.practiceRouteName,
      pageBuilder: (context, state) => const NoTransitionPage(
        child: Practice(),
      ),
      routes: [
        GoRoute(
          name: RouteConstants.practiceGamesRouteName,
          path: RouteConstants.gamesRouteName,
          builder: (context, state) => const Games(),
        ),
        GoRoute(
          name: RouteConstants.practiceReviewRouteName,
          path: RouteConstants.reviewRouteName,
          builder: (context, state) {
            return const Review();
          },
        ),
      ],
    );
  }

  static StatefulShellBranch otherBranch(
      GlobalKey<NavigatorState> navigatorKey, bool isAuth) {
    return StatefulShellBranch(
      navigatorKey: navigatorKey,
      routes: [
        otherRoute(isAuth),
      ],
    );
  }

  static GoRoute otherRoute(bool isAuth) {
    return GoRoute(
      name: RouteConstants.otherRouteName,
      path: RouteConstants.otherRouteName,
      pageBuilder: (context, state) => const NoTransitionPage(
        child: Other(),
      ),
      routes: [
        GoRoute(
          name: RouteConstants.otherOther1RouteName,
          path: RouteConstants.other1RouteName,
          builder: (context, state) => const Other1(),
        ),
        GoRoute(
          name: RouteConstants.otherOther2RouteName,
          path: RouteConstants.other2RouteName,
          builder: (BuildContext context, GoRouterState state) {
            return const Other2();
          },
        ),
      ],
    );
  }
}
