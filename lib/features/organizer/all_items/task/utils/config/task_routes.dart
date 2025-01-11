import 'package:fo_fe/core/widgets/pages/link_item_list_update_page.dart';
import 'package:fo_fe/features/organizer/all_items/tag/utils/tag_exports.dart';
import 'package:fo_fe/features/organizer/all_items/task/presentation/screens/task_delete_screen.dart';
import 'package:fo_fe/features/organizer/all_items/task/presentation/screens/task_export_to_excel_screen.dart';
import 'package:fo_fe/features/organizer/all_items/task/presentation/screens/task_update_screen.dart';
import 'package:fo_fe/features/organizer/all_items/task/presentation/screens/task_view_screen.dart';
import 'package:fo_fe/features/organizer/all_items/task/utils/task_exports.dart';
import 'package:fo_fe/features/organizer/all_items/user/utils/user_exports.dart';
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
            path: TaskRouterNames.taskUpdateRoutePath,
            name: TaskRouterNames.taskUpdateRouteName,
            pageBuilder: (context, state) {
              final taskId = state.extra as int;
              return NoTransitionPage(child: TaskUpdateScreen(taskId: taskId));
            },
            routes: [
              GoRoute(
                  path: TaskRouterNames.taskUpdateTagRoutePath,
                  name: TaskRouterNames.taskUpdateTagRouteName,
                  pageBuilder: (context, state) {
                    final UpdateItemsOfItemParams taskTagParams = UpdateItemsOfItemParams(
                      itemId: state.extra as int,
                      itemType: ItemsTypeEnum.taskTag,
                    );
                    return NoTransitionPage(
                        child: LinkItemListEditPage<TagEntity>(params: taskTagParams));
                  }),
              GoRoute(
                  path: TaskRouterNames.taskUpdateUserRoutePath,
                  name: TaskRouterNames.taskUpdateUserRouteName,
                  pageBuilder: (context, state) {
                    final UpdateItemsOfItemParams taskUserParams = UpdateItemsOfItemParams(
                      itemId: state.extra as int,
                      itemType: ItemsTypeEnum.taskUser,
                    );
                    return NoTransitionPage(
                        child: LinkItemListEditPage<UserEntity>(params: taskUserParams));
                  }),
            ]),
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
