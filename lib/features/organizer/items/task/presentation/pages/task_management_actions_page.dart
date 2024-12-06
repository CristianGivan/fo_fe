import 'package:fo_fe/features/organizer/items/task/utils/task_exports.dart';
import 'package:fo_fe/features/organizer/items/user/presentation/pages/user_management_actions_page.dart';
import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';

class TaskManagementActionsPage {
  static List<PopupMenuEntry> getMenuItems(BuildContext context) {
    return [
      PopupMenuItem(
        child: Text('Add Task'),
        onTap: () => context.pushNamed(TaskRouterNames.taskAddRouteName),
      ),
      PopupMenuItem(
        child: Text('Filter Tasks'),
        onTap: () => showFilterDialog(context),
      ),
      PopupMenuItem(
        child: Text('Sort Tasks'),
        onTap: () => showSortDialog(context),
      ),
    ];
  }
}