part of '../organizer.dart';

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
              builder: (context, state) => const TasksView(),
              //todo cg: TasksHome(),
              routes: [
                GoRoute(
                  name: OrganizerRouterNames.organizerTasksAddTasksRoute,
                  path: OrganizerRouterNames.tasksAddTasksRouteName,
                  builder: (context, state) => const AddTasks(),
                ),
                GoRoute(
                  name: OrganizerRouterNames.organizerTasksPageTasksRoute,
                  path: OrganizerRouterNames.tasksPageTasksRouteName,
                  builder: (context, state) => const TasksPage(),
                ),
              ]),
          GoRoute(
            name: OrganizerRouterNames.organizerReminderRoute,
            path: OrganizerRouterNames.reminderRouteName,
            builder: (context, state) => const Reminder(),
          ),
        ],
        redirect: (context, state) {
          //todo
          if (true) {
            return null;
            // } else {
            //   // todo shall be other screen
            //   return context.push(OrganizerRouterNames.organizerRoute);
          }
        });
  }
}
