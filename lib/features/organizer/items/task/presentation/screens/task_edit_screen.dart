import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fo_fe/features/organizer/items/tag/config/tag_exports.dart';
import 'package:fo_fe/features/organizer/items/tag/presentation/screen/tag_screen.dart';
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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                TextField(
                  decoration: const InputDecoration(labelText: 'Subject'),
                  controller: TextEditingController(text: task.subject),
                ),
                // Include other form fields to edit the task
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Handle save button press
                  },
                  child: const Text('Save'),
                ),
                ElevatedButton(
                  onPressed: () async {
                    final selectedTag = await Navigator.push<TagEntity>(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const TagScreen(),
                      ),
                    );
                    if (selectedTag != null) {
                      context.read<TaskBlocTag>().add(
                            AddTagToTaskBlocEvent(
                                taskId: task.id, tag: selectedTag),
                          );
                    }
                  },
                  child: const Text('Link'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
