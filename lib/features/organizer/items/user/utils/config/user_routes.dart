import 'package:flutter/material.dart';
import 'package:fo_fe/features/organizer/items/user/utils/user_exports.dart';
import 'package:go_router/go_router.dart';

class UserAppBranch {
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
      name: UserRouterNames.userRoute,
      path: '/user',
      pageBuilder: (context, state) => const NoTransitionPage(
        child: UserScreen(),
      ),
      routes: [
        GoRoute(
          name: UserRouterNames.addUsersFromAllUsersRoute,
          path: 'add-users/:userId',
          pageBuilder: (context, state) {
            // Accessing 'userId' from state.pathParameters
            final userId = int.parse(state.pathParameters['userId']!);
            return NoTransitionPage(
              child: AddUsersFromAllUsersScreen(userId: userId),
            );
          },
        ),
      ],
    );
  }
}
