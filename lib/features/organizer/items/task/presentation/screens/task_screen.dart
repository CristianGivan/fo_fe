import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fo_fe/features/organizer/items/task/config/task_exports.dart';
import 'package:fo_fe/features/organizer/items/task/presentation/pages/task_list_page.dart';
import 'package:fo_fe/features/organizer/items/task/presentation/pages/task_management_actions_page.dart';

class TaskScreen extends StatelessWidget {
  const TaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<TaskBlocTask>().add(TaskGetItemsAllBlocEvent());

    return Scaffold(
      appBar: AppBar(title: const Text('Task Management')),
      body: const Column(
        children: [
          Center(child: Text('All Tasks:')),
          Expanded(
            child: TaskListPage(),
          ),
          TaskManagementActionsPage(),
        ],
      ),
    );
  }
}
