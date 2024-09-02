import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fo_fe/features/organizer/items/task/config/task_exports.dart';
import 'package:fo_fe/features/organizer/items/task/presentation/pages/task_list_page.dart';
import 'package:fo_fe/features/organizer/items/task/presentation/pages/task_management_actions_page.dart';

class TaskScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    context.read<TaskBlocTask>().add(TaskGetItemsAllBlocEvent());

    return Scaffold(
      appBar: AppBar(title: Text('Task Management')),
      body: Column(
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
