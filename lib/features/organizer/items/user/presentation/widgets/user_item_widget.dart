import 'package:flutter/material.dart';

class UserItemWidget extends StatelessWidget {
  final String userName;
  final String email;

  UserItemWidget({required this.userName, required this.email});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(userName),
      subtitle: Text(email),
      onTap: () {
        // Navigate to user details or some other action
      },
    );
  }
}
