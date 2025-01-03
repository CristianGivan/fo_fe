import 'package:fo_fe/core/widgets/core_widget_exports.dart';
import 'package:fo_fe/features/organizer/all_items/task/presentation/task_card_widget.dart';
import 'package:fo_fe/features/organizer/all_items/task/presentation/widgets/item_card_container.dart';
import 'package:fo_fe/features/organizer/all_items/task/utils/task_exports.dart';
import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';

class TaskCard extends StatelessWidget {
  final TaskEntity task;

  TaskCard(
    TaskDto taskDto, {
    super.key,
  }) : task = taskDto.task;

  @override
  Widget build(BuildContext context) {
    return ItemCardContainer(
      onTap: () => _handleTap(context),
      onLongPress: () => _handleLongPress(context),
      onConfirmDismiss: (direction, context) => _handleConfirmDismiss(direction, context),
      child: TaskCardWidget(task: task),
    );
  }

  void _handleTap(BuildContext context) {
    context.pushNamed(TaskRouterNames.taskViewRouteName, extra: task.id);
  }

  void _handleLongPress(BuildContext context) {
    context.pushNamed(TaskRouterNames.taskEditRouteName, extra: task.id);
  }

  Future<bool> _handleConfirmDismiss(DismissDirection direction, BuildContext context) async {
    TaskStatus newStatus = _getNewStatus(direction, task.taskStatus!);

    final updatedTask = task.copyWith(taskStatus: newStatus);
    context.read<TaskBloc>().add(UpdateItemBlocEvent(updatedTask));

    SnackBarWidget.showAboveBottomNavBar(context, content: 'Task status updated to $newStatus');

    return false;
  }

  TaskStatus _getNewStatus(DismissDirection direction, TaskStatus currentStatus) {
    switch (direction) {
      case DismissDirection.up:
        return _incrementStatus(currentStatus);
      case DismissDirection.down:
        return _decrementStatus(currentStatus);
      case DismissDirection.startToEnd:
        return _incrementStatus(currentStatus);
      case DismissDirection.endToStart:
        return _decrementStatus(currentStatus);
      default:
        return currentStatus;
    }
  }

  TaskStatus _incrementStatus(TaskStatus currentStatus) {
    switch (currentStatus) {
      case TaskStatus.undefined:
        return TaskStatus.started;
      case TaskStatus.started:
        return TaskStatus.working;
      case TaskStatus.working:
        return TaskStatus.completed;
      case TaskStatus.pending:
        return TaskStatus.working;
      case TaskStatus.completed:
        return TaskStatus.completed;
    }
  }

  TaskStatus _decrementStatus(TaskStatus currentStatus) {
    switch (currentStatus) {
      case TaskStatus.completed:
        return TaskStatus.working;
      case TaskStatus.pending:
        return TaskStatus.started;
      case TaskStatus.working:
        return TaskStatus.pending;
      case TaskStatus.started:
        return TaskStatus.undefined;
      case TaskStatus.undefined:
        return TaskStatus.undefined;
    }
  }
}
