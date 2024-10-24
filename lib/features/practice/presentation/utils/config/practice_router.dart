import 'package:flutter/material.dart';
import 'package:fo_fe/features/practice/presentation/utils/practice_exports.dart';
import 'package:go_router/go_router.dart';

class PracticeAppBranch {
  static StatefulShellBranch branch(GlobalKey<NavigatorState> navigatorKey) {
    return StatefulShellBranch(
      navigatorKey: navigatorKey,
      routes: [
        GoRoute(
          path: '/practice',
          pageBuilder: (context, state) => const NoTransitionPage(
            child: PracticeScreen(), // Placeholder
          ),
          routes: [
            GoRoute(
              path: 'games',
              pageBuilder: (context, state) => const NoTransitionPage(
                child: GamesScreen(), // Placeholder
              ),
            ),
            GoRoute(
              path: 'practice',
              pageBuilder: (context, state) => const NoTransitionPage(
                child: PracticeScreen(), // Placeholder
              ),
            ),
            GoRoute(
              path: 'review',
              pageBuilder: (context, state) => const NoTransitionPage(
                child: ReviewScreen(), // Placeholder
              ),
            ),
          ],
        ),
      ],
    );
  }
}
