import 'package:flutter/material.dart';
import 'package:fo_fe/features/organizer/config/organizer_exports.dart';
import 'package:fo_fe/features/organizer/items/task/utils/task_exports.dart';
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
      pageBuilder: (context, state) => const NoTransitionPage(
        child: OrganizerHome(),
        // This is the root screen for the organizer
      ),
      routes: [
        GoRoute(
          name: OrganizerRouterNames.organizerTaskRoute,
          path: 'task', // Relative path for nesting
          pageBuilder: (context, state) => const NoTransitionPage(
            child: TaskScreen(),
          ),
          routes: const [
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
