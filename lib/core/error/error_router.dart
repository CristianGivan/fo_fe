import 'package:flutter/material.dart';
import 'package:fo_fe/core/error/error_page.dart';
import 'package:go_router/go_router.dart';

class ErrorAppBranch {
  static StatefulShellBranch branch(GlobalKey<NavigatorState> navigatorKey) {
    return StatefulShellBranch(
      navigatorKey: navigatorKey,
      routes: [
        GoRoute(
          path: '/error',
          name: 'error',
          pageBuilder: (context, state) {
            final message = state.extra as String?;
            return NoTransitionPage(
              child: ErrorPage(message: message ?? "Unknown error"), // Placeholder
            );
          },
          routes: [],
        ),
      ],
    );
  }
}
