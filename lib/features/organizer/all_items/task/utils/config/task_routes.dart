import 'package:fo_fe/core/widgets/core_widget_exports.dart';
import 'package:fo_fe/features/organizer/all_items/task/presentation/screens/task_delete_screen.dart';
import 'package:fo_fe/features/organizer/all_items/task/presentation/screens/task_export_to_excel_screen.dart';
import 'package:fo_fe/features/organizer/all_items/task/presentation/screens/task_update_screen.dart';
import 'package:fo_fe/features/organizer/all_items/task/presentation/screens/task_view_screen.dart';
import 'package:fo_fe/features/organizer/all_items/task/utils/task_exports.dart';
import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';

class TaskRoutes {
  static GoRoute routes() {
    return GoRoute(
      path: TaskRouterNames.taskRoutePath,
      name: TaskRouterNames.taskRouteName,
      pageBuilder: (context, state) => const NoTransitionPage(child: ItemScreen<TaskDto>()),
      routes: [
        GoRoute(
            path: TaskRouterNames.taskAddRoutePath,
            name: TaskRouterNames.taskAddRouteName,
            pageBuilder: (context, state) {
              final ItemLinkParams itemLinkParams =
                  state.extra as ItemLinkParams? ?? NoLinkParams();
              return NoTransitionPage(child: TaskAddScreen(itemLinkParams));
            }),
        GoRoute(
          path: TaskRouterNames.taskUpdateRoutePath,
          name: TaskRouterNames.taskUpdateRouteName,
          pageBuilder: (context, state) {
            final taskId = state.extra as int;
            return NoTransitionPage(child: TaskUpdateScreen(taskId: taskId));
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
        GoRoute(
          path: TaskRouterNames.taskExportRoutePath,
          name: TaskRouterNames.taskExportRouteName,
          pageBuilder: (context, state) {
            return NoTransitionPage(child: TaskExportScreen());
          },
        ),
      ],
    );
  }
}
