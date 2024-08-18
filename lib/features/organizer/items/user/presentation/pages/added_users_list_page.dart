import 'package:flutter/material.dart';
import 'package:fo_fe/features/organizer/items/user/presentation/widgets/user_item_widget.dart';

class AddedUsersListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Added Users'),
      ),
      body: ListView(
        children: [
          UserItemWidget(userName: 'John Doe', email: 'john@example.com'),
          UserItemWidget(userName: 'Jane Smith', email: 'jane@example.com'),
        ],
      ),
    );
  }
}
