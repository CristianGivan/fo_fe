import 'package:flutter/material.dart';
import 'package:fo_fe/features/organizer/items/reminder/utils/reminder_exports.dart';
import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';

class ReminderRoutes {
  static GoRoute routes() {
    return GoRoute(
      path: ReminderRouterNames.reminderRoutePath,
      name: ReminderRouterNames.reminderRouteName,
      pageBuilder: (context, state) {
        final reminderItems = state.extra as OrganizerItems<ReminderEntity>?;
        return MaterialPage(
          child: ReminderScreen(
              reminderItems: reminderItems ?? OrganizerItems.empty()),
        );
      },
      routes: [
        GoRoute(
          path: ReminderRouterNames.reminderAddRoutePath,
          name: ReminderRouterNames.reminderAddRouteName,
          pageBuilder: (context, state) {
            // Accessing 'userId' from state.pathParameters
            return const NoTransitionPage(
              child: ReminderAddScreen(),
            );
          },
        ),
      ],
    );
  }
}
