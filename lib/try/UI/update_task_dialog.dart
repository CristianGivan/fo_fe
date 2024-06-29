import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fo_fe/features/organizer/items/task/task_lib.dart';

class UpdateTaskDialog extends StatefulWidget {
  final TaskEntity task;

  UpdateTaskDialog({required this.task});

  @override
  _UpdateTaskDialogState createState() => _UpdateTaskDialogState();
}

class _UpdateTaskDialogState extends State<UpdateTaskDialog> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _subjectController;
  late DateTime _createdDate;

  @override
  void initState() {
    super.initState();
    _subjectController = TextEditingController(text: widget.task.subject);
    _createdDate = widget.task.createdDate;
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Update Task'),
      content: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              controller: _subjectController,
              decoration: InputDecoration(labelText: 'Subject'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a subject';
                }
                return null;
              },
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  final updatedTask = TaskEntity(
                    id: widget.task.id,
                    subject: _subjectController.text,
                    createdDate: _createdDate,
                  );
                  BlocProvider.of<TaskBloc>(context)
                      .add(UpdateTaskBlocEvent(updatedTask));
                  Navigator.of(context).pop();
                }
              },
              child: Text('Update Task'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _subjectController.dispose();
    super.dispose();
  }
}
