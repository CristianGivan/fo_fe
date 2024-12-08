import 'package:fo_fe/core/widgets/core_widget_exports.dart';
import 'package:fo_fe/features/organizer/items/task/presentation/task_card_widget.dart';
import 'package:fo_fe/features/organizer/items/task/utils/task_exports.dart';
import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';

class TaskCardPage extends StatelessWidget {
  final TaskEntity task;
  final Function(TaskEntity) onUpdateTask;
  final Function() onViewTask;
  final Function() onEditTask;
  final Function(TaskEntity) onDeleteTask;

  const TaskCardPage({
    super.key,
    required this.task,
    required this.onUpdateTask,
    required this.onViewTask,
    required this.onEditTask,
    required this.onDeleteTask,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onViewTask,
      onLongPress: onEditTask,
      child: Dismissible(
        key: Key(task.id.toString()),
        direction: DismissDirection.horizontal,
        confirmDismiss: (direction) async => _changeStatus(direction, context),
        background: _buildSwipeActionBackground(Icons.arrow_forward, Colors.green),
        secondaryBackground: _buildSwipeActionBackground(Icons.arrow_back, Colors.red),
        child: TaskCardWidget(
          task: task,
          onViewTask: onViewTask,
          onEditTask: onEditTask,
          onDeleteTask: () => _showDeleteConfirmation(context),
        ),
      ),
    );
  }

  bool _changeStatus(DismissDirection direction, BuildContext context) {
    TaskStatus newStatus = task.taskStatus!;
    if (direction == DismissDirection.startToEnd) {
      newStatus = _incrementStatus(task.taskStatus!);
    } else if (direction == DismissDirection.endToStart) {
      newStatus = _decrementStatus(task.taskStatus!);
    }

    final updatedTask = task.copyWith(taskStatus: newStatus);
    onUpdateTask(updatedTask);

    SnackBarWidget.showAboveBottomNavBar(context, content: 'Task status updated to $newStatus');

    return false;
  }

  void _showDeleteConfirmation(BuildContext context) {
    DialogManager.showConfirmationDialog(
      context: context,
      title: "Delete Task",
      content: "Are you sure you want to delete this task?",
      confirmButtonText: "Delete",
      onConfirm: () => onDeleteTask(task),
    );
  }

  Widget _buildSwipeActionBackground(IconData icon, Color color) {
    return Container(
      color: color,
      alignment: Alignment.center,
      child: Icon(icon, color: Colors.white, size: 30),
    );
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
