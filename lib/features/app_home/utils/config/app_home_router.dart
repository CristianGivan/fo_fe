import 'package:flutter/material.dart';
import 'package:fo_fe/features/app_home/utils/app_home_exports.dart';
import 'package:go_router/go_router.dart';

class AppHomeBranch {
  static StatefulShellBranch branch(GlobalKey<NavigatorState> navigatorKey) {
    return StatefulShellBranch(
      navigatorKey: navigatorKey,
      routes: [
        GoRoute(
          path: '/',
          pageBuilder: (context, state) => const NoTransitionPage(
            child: AppHomeScreen(), // Main Home Screen
          ),
        ),
      ],
    );
  }
}
