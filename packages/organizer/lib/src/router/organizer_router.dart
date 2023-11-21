part of organizer;

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
              child: OrganizerHome(),
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
            // todo shall be other screen
            return context.push(OrganizerRouterNames.organizerRoute);
          }
        });
  }
}
