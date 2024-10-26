import 'package:flutter/material.dart';
import 'package:fo_fe/core/del/stateful_route_shell_old.dart';
import 'package:fo_fe/features/app_home/utils/app_home_exports.dart';
import 'package:fo_fe/features/authentication/utils/authentication_exports.dart';
import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';
import 'package:fo_fe/features/practice/presentation/utils/config/practice_router.dart';
import 'package:fo_fe/features/settings/utils/config/settings_router.dart';

final _homeShellNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'home');
final _authShellNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'auth');
final _organizerShellNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'organizer');
final _practiceShellNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'practice');
final _settingsShellNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'settings');

class AppRouter {
  static GoRouter returnRouter() {
    return GoRouter(
      // initialLocation: "/",
      initialLocation: OrganizerRouterNames.organizerRoutePath,
      debugLogDiagnostics: true,
      routes: [
        StatefulShellRoute.indexedStack(
          builder: (context, state, navigationShell) {
            return ScaffoldWithNestedNavigation(
                navigationShell: navigationShell);
          },
          branches: [
            AppHomeBranch.branch(_homeShellNavigatorKey),
            // Home branch
            AuthenticationAppBranch.branch(_authShellNavigatorKey),
            // Authentication branch
            OrganizerAppBranch.branch(_organizerShellNavigatorKey),
            // Organizer branch
            PracticeAppBranch.branch(_practiceShellNavigatorKey),
            // Practice branch
            SettingsAppBranch.branch(_settingsShellNavigatorKey),
            // Settings branch
          ],
        ),
      ],
    );
  }
}
