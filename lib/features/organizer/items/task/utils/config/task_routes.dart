import 'package:fo_fe/features/organizer/items/task/presentation/screens/task_edit_screen.dart';
import 'package:fo_fe/features/organizer/items/task/presentation/screens/task_view_screen.dart';
import 'package:fo_fe/features/organizer/items/task/utils/task_exports.dart';
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
            final task = state.extra as int;
            return NoTransitionPage(child: TaskEditScreen(taskId: task));
          },
        ),
        GoRoute(
          path: TaskRouterNames.taskViewRoutePath,
          name: TaskRouterNames.taskViewRouteName,
          pageBuilder: (context, state) {
            final task = state.extra as TaskEntity?;
            return NoTransitionPage(child: TaskViewScreen(task: task!));
          },
        ),
      ],
    );
  }
}
