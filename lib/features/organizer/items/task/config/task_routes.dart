import 'package:flutter/material.dart';
import 'package:fo_fe/features/organizer/items/task/config/task_exports.dart';
import 'package:fo_fe/features/organizer/items/task/config/task_route_names.dart';
import 'package:go_router/go_router.dart';

class TaskAppBranch {
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
      name: TaskRouterNames.taskRoute,
      path: '/task',
      pageBuilder: (context, state) => NoTransitionPage(
        child: TaskScreen(),
      ),
      routes: [
        // GoRoute(
        //   name: TaskRouterNames.addTasksFromAllTasksRoute,
        //   path: 'add-users/:userId',
        //   pageBuilder: (context, state) {
        //     // Accessing 'userId' from state.pathParameters
        //     final userId = int.parse(state.pathParameters['userId']!);
        //     return NoTransitionPage(
        //       child: AddTasksFromAllTasksScreen(userId: userId),
        //     );
        //   },
        // ),
      ],
    );
  }
}
