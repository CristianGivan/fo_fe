import 'package:flutter/material.dart';
import 'package:fo_fe/features/organizer/items/user/presentation/widgets/user_item_widget.dart';

class AddedUsersListPage extends StatelessWidget {
  const AddedUsersListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Added Users'),
      ),
      body: ListView(
        children: const [
          UserItemWidget(userName: 'John Doe', email: 'john@example.com'),
          UserItemWidget(userName: 'Jane Smith', email: 'jane@example.com'),
        ],
      ),
    );
  }
}
