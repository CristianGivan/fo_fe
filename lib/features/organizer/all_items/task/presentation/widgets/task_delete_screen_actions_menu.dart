import 'package:fo_fe/core/widgets/core_widget_exports.dart';
import 'package:fo_fe/features/organizer/all_items/task/utils/task_exports.dart';
import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';

class TaskDeleteScreenActionsMenu {
  static List<PopupMenuEntry> getMenuItems(BuildContext context, IdSet selectedIds) {
    return [
      PopupMenuItem(
        child: Text('Delete Tasks'),
        onTap: () => _confirmAndDelete(context, selectedIds),
      )
    ];
  }

  static void _confirmAndDelete(BuildContext context, IdSet selectedIds) {
    DialogManager.showConfirmationDialog(
      context: context,
      title: "Delete Tasks",
      content: "Are you sure you want to delete the selected tasks?",
      confirmButtonText: "Delete",
      onConfirm: () =>
          context.read<TaskBloc>().add(DeleteItemsBlocEvent(TaskParams(idSet: selectedIds))),
    );
  }
}
