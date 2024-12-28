import 'package:fo_fe/core/widgets/core_widget_exports.dart';
import 'package:fo_fe/features/organizer/all_items/task/presentation/task_card_widget.dart';
import 'package:fo_fe/features/organizer/all_items/task/presentation/widgets/item_card_container.dart';
import 'package:fo_fe/features/organizer/all_items/task/utils/task_exports.dart';
import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';

class TaskCard extends StatelessWidget {
  final TaskEntity task;

  const TaskCard(
    this.task, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ItemCardContainer(
      onTap: () => context.pushNamed(TaskRouterNames.taskViewRouteName, extra: task.id),
      onLongPress: () => context.pushNamed(TaskRouterNames.taskEditRouteName, extra: task.id),
      onConfirmDismiss: (direction, context) => _changeStatus(direction, context),
      child: TaskCardWidget(task: task),
    );
  }

  Future<bool> _changeStatus(DismissDirection direction, BuildContext context) async {
    TaskStatus newStatus = task.taskStatus!;
    if (direction == DismissDirection.startToEnd) {
      newStatus = _incrementStatus(task.taskStatus!);
    } else if (direction == DismissDirection.endToStart) {
      newStatus = _decrementStatus(task.taskStatus!);
    }

    final updatedTask = task.copyWith(taskStatus: newStatus);
    context.read<TaskBloc>().add(UpdateItemBlocEvent(updatedTask));

    SnackBarWidget.showAboveBottomNavBar(context, content: 'Task status updated to $newStatus');

    return false;
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
      default:
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
      default:
        return TaskStatus.undefined;
    }
  }
}
