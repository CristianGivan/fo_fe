import 'package:flutter/material.dart';

class SelectUserScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Dummy list of users for selection
    final List<String> users = ['User 1', 'User 2', 'User 3'];

    return Scaffold(
      appBar: AppBar(
        title: Text('Select User'),
      ),
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(users[index]),
            onTap: () {
              // Return the selected user to the previous screen
              Navigator.pop(context, users[index]);
            },
          );
        },
      ),
    );
  }
}
