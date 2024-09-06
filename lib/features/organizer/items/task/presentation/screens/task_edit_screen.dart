import 'package:flutter/material.dart';
import 'package:fo_fe/features/organizer/items/task/config/task_exports.dart';

class TaskEditScreen extends StatelessWidget {
  final TaskEntity task;

  const TaskEditScreen({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Edit Task')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: const InputDecoration(labelText: 'Subject'),
              controller: TextEditingController(text: task.subject),
            ),
            // Include other form fields to edit the task
          ],
        ),
      ),
    );
  }
}
