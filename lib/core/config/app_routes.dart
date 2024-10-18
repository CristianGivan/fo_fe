// app_route_try.dart

import 'package:flutter/material.dart';
import 'package:fo_fe/core/del/stateful_route_shell_old.dart';
import 'package:fo_fe/features/authentication/utils/authentication_exports.dart';
import 'package:fo_fe/features/organizer/config/organizer_exports.dart';
import 'package:fo_fe/features/organizer/items/tag/utils/config/tag_routes.dart';
import 'package:fo_fe/features/organizer/items/task/utils/task_exports.dart';
import 'package:fo_fe/features/organizer/items/user/utils/user_exports.dart';
import 'package:go_router/go_router.dart';

final _organizerShellNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'organizer');
final _authShellNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'auth');
final _userShellNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'user');
final _taskShellNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'task');
final _tagShellNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'tag');

class AppRouter {
  static GoRouter returnRouter() {
    GoRouter router = GoRouter(
      initialLocation: OrganizerRouterNames.organizerRoute,
      // initialLocation: AuthenticationRouterNames.authenticationWithAutoLogInRoute,
      debugLogDiagnostics: true,
      routes: [
        StatefulShellRoute.indexedStack(
          builder: (context, state, navigationShell) {
            return ScaffoldWithNestedNavigation(
                //todo cg is needed?
                navigationShell: navigationShell);
          },
          branches: [
            OrganizerAppBranch.branch(_organizerShellNavigatorKey),
            AuthenticationAppBranch.branch(_authShellNavigatorKey),
            UserAppBranch.branch(_userShellNavigatorKey),
            TaskAppBranch.branch(_taskShellNavigatorKey),
            TagAppBranch.branch(_tagShellNavigatorKey)
          ],
        ),
      ],
    );
    return router;
  }
}
