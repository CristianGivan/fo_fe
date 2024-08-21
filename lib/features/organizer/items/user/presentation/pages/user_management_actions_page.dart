import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class UserManagementActionsPage extends StatelessWidget {
  final int userId;

  const UserManagementActionsPage({super.key, required this.userId});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                labelText: 'Search users',
                border: OutlineInputBorder(),
              ),
              onChanged: (query) {
                // context.read<UserBloc>().add(FilterUsers(query));
              },
            ),
          ),
          SizedBox(width: 16),
          ElevatedButton(
            onPressed: () {
              context.push(
                '/user/add-users/$userId', // Assuming `userId` is already an integer
              );
            },
            child: Text('Add Users'),
          ),
        ],
      ),
    );
  }
}
