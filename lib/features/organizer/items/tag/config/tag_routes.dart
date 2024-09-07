import 'package:flutter/material.dart';
import 'package:fo_fe/features/organizer/items/tag/config/tag_exports.dart';
import 'package:go_router/go_router.dart';

import '../presentation/screen/tag_screen.dart';

class TagAppBranch {
  static StatefulShellBranch branch(GlobalKey<NavigatorState> navigatorKey) {
    return StatefulShellBranch(
      navigatorKey: navigatorKey,
      routes: [
        route(),
      ],
    );
  }

  static GoRoute route() {
    return GoRoute(
      name: TagRouterNames.tagRoute,
      path: '/tag',
      pageBuilder: (context, state) => const NoTransitionPage(
        child: TagScreen(),
      ),
      routes: [
        GoRoute(
          name: TagRouterNames.tagAddRoute,
          path: 'tag_add',
          pageBuilder: (context, state) {
            // Accessing 'userId' from state.pathParameters
            return const NoTransitionPage(
              child: TagAddScreen(),
            );
          },
        ),
      ],
    );
  }
}
