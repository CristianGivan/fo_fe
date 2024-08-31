import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class TaskManagementActionsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                context.push(
                  '/task/task_add',
                );
              },
              child: Text('Add Task'),
            ),
          ),
          SizedBox(height: 16.0),
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    // Handle filter action
                  },
                  child: Text('Filter'),
                ),
              ),
              SizedBox(width: 16.0),
              Expanded(
                child: ElevatedButton(
                  onPressed: () => _showSortDialog(context),
                  child: Text('Sort'),
                ),
              ),
            ],
          ),
          SizedBox(height: 16.0),
          TextField(
            decoration: InputDecoration(
              labelText: 'Enter task description',
              border: OutlineInputBorder(),
            ),
          ),
        ],
      ),
    );
  }

  void _showSortDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Sort Tasks'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: Text('By Date'),
                onTap: () {
                  // Handle sorting by date
                  Navigator.of(context).pop();
                  // TODO: Implement sorting logic
                },
              ),
              ListTile(
                title: Text('By Status'),
                onTap: () {
                  // Handle sorting by status
                  Navigator.of(context).pop();
                  // TODO: Implement sorting logic
                },
              ),
              ListTile(
                title: Text('By Priority'),
                onTap: () {
                  // Handle sorting by priority
                  Navigator.of(context).pop();
                  // TODO: Implement sorting logic
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
