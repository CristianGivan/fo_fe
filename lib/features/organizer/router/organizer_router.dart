import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

import '../../../core/router/routes/app_route_constants.dart';
import '../presentation/screens/organizer_screen.dart';
import '../presentation/screens/reminders_screen.dart';
import '../presentation/screens/tasks_screen.dart';
import '../presentation/screens/topics_screen.dart';
import 'organizer_router_names.dart';

class OrganizerAppBranch {
  static StatefulShellBranch branch(
    GlobalKey<NavigatorState> navigatorKey,
    bool isAuth,
  ) {
    return StatefulShellBranch(
      navigatorKey: navigatorKey,
      routes: [
        route(isAuth),
      ],
    );
  }

  static GoRoute route(bool isAuth) {
    return GoRoute(
        name: OrganizerRouterNames.organizerRoute,
        path: OrganizerRouterNames.organizerRoute,
        pageBuilder: (context, state) => const NoTransitionPage(
              child: Organizer(),
            ),
        routes: [
          GoRoute(
            name: OrganizerRouterNames.organizerTopicsRoute,
            path: OrganizerRouterNames.topicRouteName,
            builder: (context, state) => const Topics(),
          ),
          GoRoute(
            name: OrganizerRouterNames.organizerTasksRoute,
            path: OrganizerRouterNames.tasksRouteName,
            builder: (context, state) => const Tasks(),
          ),
          GoRoute(
            name: OrganizerRouterNames.organizerReminderRoute,
            path: OrganizerRouterNames.reminderRouteName,
            builder: (context, state) => const Reminder(),
          ),
        ],
        redirect: (context, state) {
          if (isAuth) {
            return null;
          } else {
            return context.push(RouteCoreConstants.homeMenuName);
          }
        });
  }
}
