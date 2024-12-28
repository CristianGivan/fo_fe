import 'package:fo_fe/core/widgets/messages/dialog_manager.dart';
import 'package:fo_fe/features/organizer/all_items/task/utils/task_exports.dart';
import 'package:fo_fe/features/organizer/all_items/user/presentation/pages/user_management_actions_page.dart';
import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';

class TaskScreenActionsMenu {
  static List<PopupMenuEntry> getMenuItems(BuildContext context) {
    return [
      PopupMenuItem(
        child: Text('Add Task'),
        onTap: () => context.pushNamed(TaskRouterNames.taskAddRouteName),
      ),
      PopupMenuItem(
        child: Text('Delete Task'),
        onTap: () => _confirmAndDelete(context),
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

  static void _confirmAndDelete(BuildContext context) {
    DialogManager.showConfirmationDialog(
      context: context,
      title: "Delete Tasks",
      content: "Are you sure you want to delete the selected tasks?",
      confirmButtonText: "Delete",
      onConfirm: () => context.read<TaskBloc>().add(DeleteItemBlocEvent(1)),
    );
  }
}
