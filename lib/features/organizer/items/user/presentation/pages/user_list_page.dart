import 'package:flutter/material.dart';

import '../widgets/user_item_widget.dart';

class UserListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User List'),
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
