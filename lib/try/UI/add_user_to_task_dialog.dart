import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fo_fe/features/organizer/items/user/domain/entities/user_entity.dart';

import '../../features/organizer/items/task/task_lib.dart';

class AddUserToTaskDialog extends StatefulWidget {
  final int taskId;

  AddUserToTaskDialog({required this.taskId});

  @override
  _AddUserToTaskDialogState createState() => _AddUserToTaskDialogState();
}

class _AddUserToTaskDialogState extends State<AddUserToTaskDialog> {
  final _formKey = GlobalKey<FormState>();
  final _userNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Add User to Task'),
      content: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              controller: _userNameController,
              decoration: InputDecoration(labelText: 'User Name'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a user name';
                }
                return null;
              },
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  final user = UserEntity(
                    id: 0, // This will be replaced by the database
                    name: _userNameController.text,
                  );
                  BlocProvider.of<TaskBloc>(context)
                      .add(AddUserToTaskBlocEvent(widget.taskId, user));
                  Navigator.of(context).pop();
                }
              },
              child: Text('Add User'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _userNameController.dispose();
    super.dispose();
  }
}
