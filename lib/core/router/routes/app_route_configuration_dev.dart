import 'package:flutter/material.dart';
import 'package:fo_fe/try/UI/task_screen.dart';
import 'package:go_router/go_router.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();

class AppRouterDev {
  static GoRouter returnRouter() {
    GoRouter router = GoRouter(
      initialLocation: '/tasks', // Directly to the task screen
      debugLogDiagnostics: true,
      routes: [
        GoRoute(
          name: 'tasks',
          path: '/tasks',
          builder: (BuildContext context, GoRouterState state) {
            return TaskScreen(); // Specific screen for testing
          },
        ),
        // Add more routes as needed for development
      ],
    );
    return router;
  }
}
