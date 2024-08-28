import 'package:flutter/material.dart';
import 'package:fo_fe/features/organizer/items/organizer_item/config/organizer_item_export.dart';
import 'package:fo_fe/features/organizer/items/task/config/task_exports.dart';

class TaskCardPage extends StatelessWidget {
  final TaskEntity task;
  final Function(TaskEntity) onUpdateTask;
  final Function() onViewTask;
  final Function() onEditTask;

  const TaskCardPage({
    Key? key,
    required this.task,
    required this.onUpdateTask,
    required this.onViewTask,
    required this.onEditTask,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onViewTask,
      onLongPress: onEditTask,
      child: Dismissible(
        key: Key(task.id.toString()),
        direction: DismissDirection.horizontal,
        onDismissed: (direction) {
          TaskStatus newStatus = task.taskStatus!;
          if (direction == DismissDirection.startToEnd) {
            // Swiped right, increase status
            newStatus = _incrementStatus(task.taskStatus!);
          } else if (direction == DismissDirection.endToStart) {
            // Swiped left, decrease status
            newStatus = _decrementStatus(task.taskStatus!);
          }

          // Update the task with the new status
          onUpdateTask(task.copyWith(taskStatus: newStatus));

          // Show a snackbar or similar to inform the user
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Task status updated to $newStatus')),
          );
        },
        background:
            _buildSwipeActionBackground(Icons.arrow_forward, Colors.green),
        secondaryBackground:
            _buildSwipeActionBackground(Icons.arrow_back, Colors.red),
        child: Card(
          margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
          elevation: 4.0,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Row to push _buildTaskStatus to the right
                Row(
                  children: [
                    Text(
                      task.subject,
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Spacer(),
                    _buildTaskStatus("Status", task.taskStatus),
                  ],
                ),
                SizedBox(height: 8.0),
                Row(
                  children: [
                    _buildTaskDateRow("Start Date", task.startDate),
                    SizedBox(width: 10),
                    _buildTaskDateRow("End Date", task.endDate),
                    SizedBox(width: 10),
                    _buildTaskProgress("Progress", task.workingProgress),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
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

  Widget _buildTaskDateRow(String label, DateTime? date) {
    return Row(
      children: [
        Text(
          '$label: ',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        Text(
          date != null ? date.toLocal().toString().split(' ')[0] : 'N/A',
        ),
      ],
    );
  }

  Widget _buildTaskProgress(String label, double? progress) {
    return Row(
      children: [
        Text(
          '$label: ',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        Text(
          progress != null ? '${(progress * 100).toStringAsFixed(2)}%' : 'N/A',
        ),
      ],
    );
  }

  Widget _buildTaskStatus(String label, TaskStatus? status) {
    return Row(
      children: [
        Text(
          '$label: ',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        Text(
          status != null ? status.toString().split('.').last : 'N/A',
        ),
      ],
    );
  }
}
