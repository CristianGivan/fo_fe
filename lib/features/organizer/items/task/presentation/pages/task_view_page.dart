import 'package:flutter/material.dart';
import 'package:fo_fe/features/organizer/items/task/config/task_exports.dart';

class TaskViewPage extends StatelessWidget {
  final TaskEntity task;

  const TaskViewPage({Key? key, required this.task}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('View Task')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Subject: ${task.subject}', style: TextStyle(fontSize: 18)),
            SizedBox(height: 10),
            Text('Start Date: ${task.startDate}'),
            Text('End Date: ${task.endDate}'),
            Text('Status: ${task.taskStatus}'),
            // Display other task details...
          ],
        ),
      ),
    );
  }
}
