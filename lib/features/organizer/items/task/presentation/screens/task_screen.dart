import 'package:flutter/material.dart';
import 'package:fo_fe/features/organizer/items/task/presentation/pages/task_list_page.dart';
import 'package:fo_fe/features/organizer/items/task/presentation/pages/task_management_actions_page.dart';

class TaskScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Task Management'),
      ),
      body: Column(
        children: [
          Center(child: Text('All Tasks:')),
          // Expanded Task List Widget
          Expanded(
            child: TaskListPage(), // Replace with your task list widget
          ),
          // Task Management Actions at the bottom
          TaskManagementActionsPage(),
          // Replace with your task management widget
        ],
      ),
    );
  }
}
