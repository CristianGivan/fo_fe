import 'package:fo_fe/core/utils/exports/external_exports.dart';
import 'package:fo_fe/core/widgets/core_widget_exports.dart';
import 'package:fo_fe/features/organizer/items/task/presentation/task_card_widget.dart';
import 'package:fo_fe/features/organizer/items/task/presentation/widgets/ItemCard.dart';
import 'package:fo_fe/features/organizer/items/task/utils/task_exports.dart';

class TaskCard extends StatelessWidget {
  final TaskEntity task;
  final Function() onViewTask;
  final Function() onEditTask;

  const TaskCard({
    super.key,
    required this.task,
    required this.onViewTask,
    required this.onEditTask,
  });

  @override
  Widget build(BuildContext context) {
    return ItemCardContainer(
      onTap: onViewTask,
      onLongPress: onEditTask,
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
    context.read<TaskBloc>().add(TaskUpdateBlocEvent(updatedTask));

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
