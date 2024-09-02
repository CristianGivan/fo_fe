import 'package:flutter/material.dart';
import 'package:fo_fe/features/organizer/config/organizer_exports.dart';
import 'package:fo_fe/features/organizer/items/task/config/task_exports.dart';
import 'package:go_router/go_router.dart';

class OrganizerAppBranch {
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
      name: OrganizerRouterNames.organizerRoute,
      path: '/organizer',
      pageBuilder: (context, state) => NoTransitionPage(
        child: OrganizerHome(),
        // This is the root screen for the organizer
      ),
      routes: [
        GoRoute(
          name: OrganizerRouterNames.organizerTaskRoute,
          path: 'task', // Relative path for nesting
          pageBuilder: (context, state) => NoTransitionPage(
            child: TaskScreen(),
          ),
          routes: [
            // GoRoute(
            //   name: OrganizerRouterNames.organizerTaskAddTaskRoute,
            //   path: OrganizerRouterNames.organizerTaskAddTaskName,
            //   pageBuilder: (context, state) => NoTransitionPage(
            //     child: AddTaskScreen(),
            //   ),
            // ),
          ],
        ),
      ],
    );
  }
}
