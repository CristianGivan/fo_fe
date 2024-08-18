import 'package:flutter/material.dart';
import 'package:fo_fe/features/organizer/items/user/config/user_exports.dart';
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
      pageBuilder: (context, state) => NoTransitionPage(
        child: UserScreen(),
      ),
      routes: [
        GoRoute(
          name: UserRouterNames.addUsersFromAllUsersRoute,
          path: 'add-users',
          pageBuilder: (context, state) => NoTransitionPage(
            child: AddUsersFromAllUsersScreen(),
          ),
        ),
        // GoRoute(
        //   name: UserRouterNames.userSettingsRoute,
        //   path: 'settings',
        //   pageBuilder: (context, state) => NoTransitionPage(
        //     child: UserSettingsScreen(),
        //   ),
        // ),
      ],
    );
  }
}
