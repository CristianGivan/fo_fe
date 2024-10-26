import 'package:flutter/material.dart';
import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';

class UserManagementActionsPage extends StatelessWidget {
  final int userId;

  const UserManagementActionsPage({super.key, required this.userId});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              decoration: const InputDecoration(
                labelText: 'Search users',
                border: OutlineInputBorder(),
              ),
              onChanged: (query) {
                // context.read<UserBloc>().add(FilterUsers(query));
              },
            ),
          ),
          const SizedBox(width: 16),
          ElevatedButton(
            onPressed: () {
              context.push(
                '/user/add-users/$userId', // Assuming `userId` is already an integer
              );
            },
            child: const Text('Add Users'),
          ),
        ],
      ),
    );
  }
}
