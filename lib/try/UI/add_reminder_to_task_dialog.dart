import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fo_fe/features/organizer/items/organizer_item/domain/entities/reminder_entity.dart';
import 'package:fo_fe/features/organizer/items/task/task_lib.dart';

class AddReminderToTaskDialog extends StatefulWidget {
  final int taskId;

  AddReminderToTaskDialog({required this.taskId});

  @override
  _AddReminderToTaskDialogState createState() =>
      _AddReminderToTaskDialogState();
}

class _AddReminderToTaskDialogState extends State<AddReminderToTaskDialog> {
  final _formKey = GlobalKey<FormState>();
  DateTime _reminderDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Add Reminder to Task'),
      content: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              decoration: InputDecoration(labelText: 'Reminder Date'),
              onTap: () async {
                FocusScope.of(context).requestFocus(new FocusNode());
                final DateTime? picked = await showDatePicker(
                  context: context,
                  initialDate: _reminderDate,
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2101),
                );
                if (picked != null && picked != _reminderDate)
                  setState(() {
                    _reminderDate = picked;
                  });
              },
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  final reminder = ReminderEntity(
                    id: 0, // This will be replaced by the database
                    reminderDate: _reminderDate,
                  );
                  BlocProvider.of<TaskBloc>(context)
                      .add(AddReminderToTaskBlocEvent(widget.taskId, reminder));
                  Navigator.of(context).pop();
                }
              },
              child: Text('Add Reminder'),
            ),
          ],
        ),
      ),
    );
  }
}
