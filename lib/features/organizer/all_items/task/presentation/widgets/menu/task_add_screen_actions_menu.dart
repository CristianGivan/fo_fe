import 'package:fo_fe/features/organizer/all_items/task/presentation/logic/task_cubit/task_form_cubit.dart';
import 'package:fo_fe/features/organizer/all_items/task/utils/task_exports.dart';
import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';
import 'package:fo_fe/features/organizer/utils/other/item_type/item_add_params.dart';

class TaskAddScreenActionsMenu {
  static List<PopupMenuEntry> getMenuItems(BuildContext context, int userId) {
    return [
      PopupMenuItem(
        child: const Text('Save Task'),
        onTap: () => onTap(context, userId),
      ),
      PopupMenuItem(
        child: const Text('Add User'),
        onTap: () => context.pop(),
      ),
      PopupMenuItem(
        child: const Text('Not Save'),
        onTap: () => context.pop(),
      ),
    ];
  }

  static void onTap(BuildContext context, int userId) {
    final taskFormCubit = context.read<TaskFormCubit>();
    final taskFormState = taskFormCubit.state;

    final task = TaskEntity(
      id: 0,
      subject: taskFormState.subject,
      createdDate: DateTime.now(),
      creatorId: userId,
      checksum: taskFormState.checksum.isNotEmpty ? taskFormState.checksum : null,
      startDate: taskFormState.startDate,
      endDate: taskFormState.endDate,
      workingTime: taskFormState.workingTime,
      estimatedTime: taskFormState.estimatedTime,
      estimatedLeftTime: taskFormState.estimatedLeftTime,
      workingProgress: taskFormState.workingProgress,
      taskStatus: taskFormState.taskStatus,
    );

    final AddItemParams addItemParams = AddItemParams(
      item: task,
      itemType: ItemsTypeEnum.task,
    );

    BlocProvider.of<TaskBloc>(context).add(AddItemBlocEvent(addItemParams));
    context.pop();
  }
}
