import 'package:flutter/material.dart';
import 'package:fo_fe/features/settings/utils/settings_exports.dart';
import 'package:go_router/go_router.dart';

class SettingsAppBranch {
  static StatefulShellBranch branch(GlobalKey<NavigatorState> navigatorKey) {
    return StatefulShellBranch(
      navigatorKey: navigatorKey,
      routes: [
        GoRoute(
          path: '/settings',
          pageBuilder: (context, state) => const NoTransitionPage(
            child: SettingsScreen(), // Placeholder
          ),
          routes: [
            // GoRoute(
            //   path: 'display',
            //   pageBuilder: (context, state) => const NoTransitionPage(
            //     child: DisplayScreen(), // Placeholder
            //   ),
            // ),
            // GoRoute(
            //   path: 'view',
            //   pageBuilder: (context, state) => const NoTransitionPage(
            //     child: ViewScreen(), // Placeholder
            //   ),
            // ),
          ],
        ),
      ],
    );
  }
}
