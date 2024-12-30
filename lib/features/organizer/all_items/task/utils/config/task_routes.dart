import 'package:fo_fe/features/organizer/all_items/task/presentation/screens/task_delete_screen.dart';
import 'package:fo_fe/features/organizer/all_items/task/presentation/screens/task_edit_screen.dart';
import 'package:fo_fe/features/organizer/all_items/task/presentation/screens/task_view_screen.dart';
import 'package:fo_fe/features/organizer/all_items/task/utils/task_exports.dart';
import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';

class TaskRoutes {
  static GoRoute routes() {
    return GoRoute(
      path: TaskRouterNames.taskRoutePath,
      name: TaskRouterNames.taskRouteName,
      pageBuilder: (context, state) => const NoTransitionPage(child: TaskScreen()),
      routes: [
        GoRoute(
          path: TaskRouterNames.taskAddRoutePath,
          name: TaskRouterNames.taskAddRouteName,
          pageBuilder: (context, state) => const NoTransitionPage(child: TaskAddScreen()),
        ),
        GoRoute(
          path: TaskRouterNames.taskEditRoutePath,
          name: TaskRouterNames.taskEditRouteName,
          pageBuilder: (context, state) {
            final taskId = state.extra as int;
            return NoTransitionPage(child: TaskEditScreen(taskId: taskId));
          },
        ),
        GoRoute(
          path: TaskRouterNames.taskDeleteRoutePath,
          name: TaskRouterNames.taskDeleteRouteName,
          pageBuilder: (context, state) {
            return NoTransitionPage(child: TaskDeleteScreen());
          },
        ),
        GoRoute(
          path: TaskRouterNames.taskViewRoutePath,
          name: TaskRouterNames.taskViewRouteName,
          pageBuilder: (context, state) {
            final taskId = state.extra as int;
            return NoTransitionPage(child: TaskViewScreen(taskId: taskId));
          },
        ),
      ],
    );
  }
}
