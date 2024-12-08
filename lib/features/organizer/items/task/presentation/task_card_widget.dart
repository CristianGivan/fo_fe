import 'package:flutter/material.dart';
import 'package:fo_fe/features/organizer/items/task/utils/task_exports.dart';

class TaskCardWidget extends StatelessWidget {
  final TaskEntity task;
  final VoidCallback onViewTask;
  final VoidCallback onEditTask;
  final VoidCallback onDeleteTask;

  const TaskCardWidget({
    required this.task,
    required this.onViewTask,
    required this.onEditTask,
    required this.onDeleteTask,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
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
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.delete, color: Colors.red),
                  onPressed: onDeleteTask,
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
                          child: _buildTaskStatus("Status", task.taskStatus),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: _buildTaskDateRow("Start Date", task.startDate),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: _buildTaskDateRow("End Date", task.endDate),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: _buildTaskProgress("Progress", task.workingProgress),
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
    );
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
