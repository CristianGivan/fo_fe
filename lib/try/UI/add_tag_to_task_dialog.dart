import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fo_fe/features/organizer/items/tag/domain/entities/tag_entity.dart';
import 'package:fo_fe/features/organizer/items/task/task_lib.dart';

class AddTagToTaskDialog extends StatefulWidget {
  final int taskId;

  AddTagToTaskDialog({required this.taskId});

  @override
  _AddTagToTaskDialogState createState() => _AddTagToTaskDialogState();
}

class _AddTagToTaskDialogState extends State<AddTagToTaskDialog> {
  final _formKey = GlobalKey<FormState>();
  final _tagNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Add Tag to Task'),
      content: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              controller: _tagNameController,
              decoration: InputDecoration(labelText: 'Tag Name'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a tag name';
                }
                return null;
              },
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  final tag = TagEntity(
                    id: 0, // This will be replaced by the database
                    name: _tagNameController.text,
                  );
                  BlocProvider.of<TaskBloc>(context)
                      .add(AddTagToTaskBlocEvent(widget.taskId, tag));
                  Navigator.of(context).pop();
                }
              },
              child: Text('Add Tag'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _tagNameController.dispose();
    super.dispose();
  }
}
