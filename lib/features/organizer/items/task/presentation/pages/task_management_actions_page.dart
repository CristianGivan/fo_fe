import 'package:flutter/material.dart';

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
                // Handle add tas k action
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
                  onPressed: () {
                    // Handle sort action
                  },
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
}
