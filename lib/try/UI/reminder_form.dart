import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fo_fe/features/organizer/items/reminder/config/reminder_exports.dart';
import 'package:fo_fe/features/organizer/items/task/presentation/logic/task_bloc/task_bloc.dart';

class ReminderForm extends StatefulWidget {
  final int taskId;

  const ReminderForm({super.key, required this.taskId});

  @override
  _ReminderFormState createState() => _ReminderFormState();
}

class _ReminderFormState extends State<ReminderForm> {
  final _formKey = GlobalKey<FormState>();
  String _reminderDescription = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Reminder'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                decoration: const InputDecoration(labelText: 'Reminder Description'),
                onSaved: (value) {
                  _reminderDescription = value!;
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _submitForm,
                child: const Text('Add Reminder'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      BlocProvider.of<TaskBlocReminder>(context).add(
        AddReminderToTaskBlocEvent(
            widget.taskId,
            ReminderEntity(
                subject: _reminderDescription, remindAt: DateTime.now())),
      );
      Navigator.pop(context);
    }
  }
}
