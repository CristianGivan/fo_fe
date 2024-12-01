import 'package:flutter/material.dart';
import 'package:fo_fe/features/organizer/items/task/presentation/pages/task_filter_dialog.dart';
import 'package:fo_fe/features/organizer/items/task/presentation/pages/task_sort_dialog.dart';
import 'package:fo_fe/features/organizer/items/task/utils/task_exports.dart';
import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';

class TaskManagementActionsPage extends StatelessWidget {
  const TaskManagementActionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const AddTaskButton(),
          const SizedBox(height: 16.0),
          const TaskActionButtons(),
        ],
      ),
    );
  }
}

class AddTaskButton extends StatelessWidget {
  const AddTaskButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () => context.pushNamed(TaskRouterNames.taskAddRouteName),
        child: const Text('Add Task'),
      ),
    );
  }
}

class TaskActionButtons extends StatelessWidget {
  const TaskActionButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
            onPressed: () => showFilterDialog(context),
            child: const Text('Filter Tasks'),
          ),
        ),
        const SizedBox(width: 16.0),
        Expanded(
          child: ElevatedButton(
            onPressed: () => showSortDialog(context),
            child: const Text('Sort Tasks'),
          ),
        ),
      ],
    );
  }
}
