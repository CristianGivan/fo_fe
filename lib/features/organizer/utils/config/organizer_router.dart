import 'package:flutter/material.dart';
import 'package:fo_fe/features/organizer/items/reminder/utils/config/reminder_routes.dart';
import 'package:fo_fe/features/organizer/items/tag/utils/tag_exports.dart';
import 'package:fo_fe/features/organizer/items/task/utils/task_exports.dart';
import 'package:fo_fe/features/organizer/items/user/utils/user_exports.dart';
import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';

class OrganizerAppBranch {
  static StatefulShellBranch branch(GlobalKey<NavigatorState> navigatorKey) {
    return StatefulShellBranch(
      navigatorKey: navigatorKey,
      routes: [
        GoRoute(
          path: OrganizerRouterNames.organizerRoutePath,
          name: OrganizerRouterNames.organizerRouteName,
          pageBuilder: (context, state) => const NoTransitionPage(
            child: OrganizerHomeScreen(),
          ),
          routes: [
            UserRoutes.routes(),
            TaskRoutes.routes(),
            TagRoutes.routes(),
            ReminderRoutes.routes(),
          ],
        ),
      ],
    );
  }
}
