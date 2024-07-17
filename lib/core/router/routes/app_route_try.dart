import 'package:flutter/material.dart';
import 'package:fo_fe/core/router/routes/stateful_shell_route.dart';
import 'package:fo_fe/features/organizer/organizer.dart'; // Adjust the import path as necessary
import 'package:go_router/go_router.dart';

final _organizerShellNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'organizer');

class AppRouterTry {
  static GoRouter returnRouter() {
    GoRouter router = GoRouter(
      initialLocation: OrganizerRouterNames.organizerRoute,
      debugLogDiagnostics: true,
      routes: [
        StatefulShellRoute.indexedStack(
          builder: (context, state, navigationShell) {
            return ScaffoldWithNestedNavigation(
                navigationShell: navigationShell);
          },
          branches: [
            OrganizerAppBranch.branch(_organizerShellNavigatorKey),
          ],
        ),
      ],
    );
    return router;
  }
}
