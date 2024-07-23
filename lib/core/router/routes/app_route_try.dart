// app_route_try.dart

import 'package:flutter/material.dart';
import 'package:fo_fe/core/router/routes/stateful_shell_route.dart';
import 'package:fo_fe/features/authentication/authentication_exports.dart';
import 'package:fo_fe/features/authentication/util/router/authentication_router_names.dart';
import 'package:fo_fe/features/organizer/organizer.dart'; // Adjust the import path as necessary
import 'package:go_router/go_router.dart';

final _organizerShellNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'organizer');
final _authShellNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'auth');

class AppRouterTry {
  static GoRouter returnRouter() {
    GoRouter router = GoRouter(
      initialLocation: AuthenticationRouterNames.authenticationRoute,
      debugLogDiagnostics: true,
      routes: [
        StatefulShellRoute.indexedStack(
          builder: (context, state, navigationShell) {
            return ScaffoldWithNestedNavigation(
                navigationShell: navigationShell);
          },
          branches: [
            OrganizerAppBranch.branch(_organizerShellNavigatorKey),
            AuthenticationAppBranch.branch(_authShellNavigatorKey),
            // Add authentication branch
          ],
        ),
      ],
    );
    return router;
  }
}
