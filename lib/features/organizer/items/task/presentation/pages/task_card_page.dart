import 'package:flutter/material.dart';
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
        confirmDismiss: (direction) async {
          TaskStatus newStatus = task.taskStatus!;
          if (direction == DismissDirection.startToEnd) {
            newStatus = _incrementStatus(task.taskStatus!);
          } else if (direction == DismissDirection.endToStart) {
            newStatus = _decrementStatus(task.taskStatus!);
          }

          final updatedTask = task.copyWith(taskStatus: newStatus);
          onUpdateTask(updatedTask);

          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Task status updated to $newStatus')),
          );

          return false;
        },
        background:
            _buildSwipeActionBackground(Icons.arrow_forward, Colors.green),
        secondaryBackground:
            _buildSwipeActionBackground(Icons.arrow_back, Colors.red),
        child: Card(
          margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
          elevation: 4.0,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        task.subject,
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.delete, color: Colors.red),
                      onPressed: () => _showDeleteConfirmation(context),
                    ),
                  ],
                ),
                const SizedBox(height: 8.0),
                Row(children: [
                  Expanded(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child:
                                  _buildTaskStatus("Status", task.taskStatus),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: _buildTaskDateRow(
                                  "Start Date", task.startDate),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child:
                                  _buildTaskDateRow("End Date", task.endDate),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: _buildTaskProgress(
                                  "Progress", task.workingProgress),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ])
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showDeleteConfirmation(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Delete Task"),
          content: const Text("Are you sure you want to delete this task?"),
          actions: <Widget>[
            TextButton(
              child: const Text("Cancel"),
              onPressed: () => context.pop(),
            ),
            TextButton(
              child: const Text("Delete"),
              onPressed: () {
                onDeleteTask(task);
                context.pop();
              },
            ),
          ],
        );
      },
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
    return Column(
      children: [
        Text(
          '$label: ',
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        Text(
          date != null ? date.toLocal().toString().split(' ')[0] : 'N/A',
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }

  Widget _buildTaskProgress(String label, double? progress) {
    return Column(
      children: [
        Text(
          '$label: ',
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        Text(
          progress != null ? '${(progress * 100).toStringAsFixed(2)}%' : 'N/A',
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }

  Widget _buildTaskStatus(String label, TaskStatus? status) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '$label: ',
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        Text(
          status != null ? status.toString().split('.').last : 'N/A',
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}
