import 'package:flutter/material.dart';
import 'package:fo_fe/features/organizer/items/user/presentation/widgets/user_item_widget.dart';

class UserListWidget extends StatelessWidget {
  final int userId;

  const UserListWidget({super.key, required this.userId});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        UserItemWidget(userName: 'John Doe', email: 'john@example.com'),
        UserItemWidget(userName: 'Jane Smith', email: 'jane@example.com'),
        UserItemWidget(userName: 'Jane Smith', email: 'jane@example.com'),
        UserItemWidget(userName: 'Jane Smith', email: 'jane@example.com'),
        UserItemWidget(userName: 'Jane Smith', email: 'jane@example.com'),
        UserItemWidget(userName: 'Jane Smith', email: 'jane@example.com'),
        UserItemWidget(userName: 'Jane Smith', email: 'jane@example.com'),
        UserItemWidget(userName: 'Jane Smith', email: 'jane@example.com'),
        UserItemWidget(userName: 'Jane Smith', email: 'jane@example.com'),
        UserItemWidget(userName: 'Jane Smith', email: 'jane@example.com'),
        UserItemWidget(userName: 'Jane Smith', email: 'jane@example.com'),
        UserItemWidget(userName: 'Jane Smith', email: 'jane@example.com'),
        UserItemWidget(userName: 'Jane Smith', email: 'jane@example.com'),
        UserItemWidget(userName: 'Jane Smith', email: 'jane@example.com'),
        UserItemWidget(userName: 'Jane Smith', email: 'jane@example.com'),
        UserItemWidget(userName: 'Jane Smith', email: 'jane@example.com'),
        UserItemWidget(userName: 'Jane Smith', email: 'jane@example.com'),
        UserItemWidget(userName: 'Jane Smith', email: 'jane@example.com'),
        UserItemWidget(userName: 'Jane Smith', email: 'jane@example.com'),
      ],
    );
  }
}
