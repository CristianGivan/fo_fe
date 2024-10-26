import 'package:flutter/material.dart';
import 'package:fo_fe/features/organizer/items/tag/utils/tag_exports.dart';
import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';

import '../../presentation/screen/tag_screen.dart';

class TagRoutes {
  static GoRoute routes() {
    return GoRoute(
      path: TagRouterNames.tagRoutePath,
      name: TagRouterNames.tagRouteName,
      pageBuilder: (context, state) {
        final tagItems = state.extra as OrganizerItems<TagEntity>?;
        return MaterialPage(
          child: TagScreen(tagItems: tagItems ?? OrganizerItems.empty()),
        );
      },
      routes: [
        GoRoute(
          path: TagRouterNames.tagAddRoutePath,
          name: TagRouterNames.tagAddRouteName,
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
