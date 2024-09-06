import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fo_fe/features/organizer/items/organizer_item/config/organizer_item_export.dart';
import 'package:fo_fe/features/organizer/items/task/config/task_exports.dart';

class TaskAddScreen extends StatefulWidget {
  const TaskAddScreen({super.key});

  @override
  _AddTaskScreenState createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<TaskAddScreen> {
  final _formKey = GlobalKey<FormState>();
  final _subjectController = TextEditingController();
  final _checksumController = TextEditingController();
  final _startDateController = TextEditingController();
  final _endDateController = TextEditingController();
  final _workingTimeController = TextEditingController();
  final _estimatedTimeController = TextEditingController();
  final _estimatedLeftTimeController = TextEditingController();
  final _workingProgressController = TextEditingController();
  final _taskStatusController = TextEditingController();

  String? _selectedUser; // Variable to store the selected user

  Future<void> _selectDateTime(
      BuildContext context, TextEditingController controller) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (pickedDate != null) {
      final TimeOfDay? pickedTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
      );

      if (pickedTime != null) {
        final DateTime pickedDateTime = DateTime(
          pickedDate.year,
          pickedDate.month,
          pickedDate.day,
          pickedTime.hour,
          pickedTime.minute,
        );

        setState(() {
          controller.text =
              pickedDateTime.toIso8601String(); // Use a standardized format
        });
      }
    }
  }

  Future<void> _navigateAndSelectUser(BuildContext context) async {
    // final result = await Navigator.push(
    //   context,
    //   MaterialPageRoute(builder: (context) => SelectUserScreen()),
    // );
    //
    // if (result != null) {
    //   setState(() {
    //     _selectedUser = result; // Set the selected user
    //   });
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Task'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _subjectController,
                decoration: const InputDecoration(labelText: 'Subject'),
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'Please enter a subject';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _checksumController,
                decoration: const InputDecoration(labelText: 'Checksum'),
              ),
              TextFormField(
                controller: _startDateController,
                decoration: const InputDecoration(labelText: 'Start Date'),
                readOnly: true,
                onTap: () => _selectDateTime(context, _startDateController),
              ),
              TextFormField(
                controller: _endDateController,
                decoration: const InputDecoration(labelText: 'End Date'),
                readOnly: true,
                onTap: () => _selectDateTime(context, _endDateController),
              ),
              TextFormField(
                controller: _workingTimeController,
                decoration: const InputDecoration(labelText: 'Working Time'),
              ),
              TextFormField(
                controller: _estimatedTimeController,
                decoration: const InputDecoration(labelText: 'Estimated Time'),
              ),
              TextFormField(
                controller: _estimatedLeftTimeController,
                decoration: const InputDecoration(labelText: 'Estimated Left Time'),
              ),
              TextFormField(
                controller: _workingProgressController,
                decoration: const InputDecoration(labelText: 'Working Progress'),
              ),
              TextFormField(
                controller: _taskStatusController,
                decoration: const InputDecoration(labelText: 'Task Status'),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  _navigateAndSelectUser(context);
                },
                child: const Text('Select User'),
              ),
              if (_selectedUser != null)
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text('Selected User: $_selectedUser'),
                ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState?.validate() ?? false) {
                    final task = TaskEntity(
                      id: 0,
                      // ID will be auto-generated
                      subject: _subjectController.text,
                      createdDate:
                          DateTime.parse(DateTime.now().toIso8601String()),
                      creatorId: int.parse("1"),
                      checksum: _checksumController.text.isNotEmpty
                          ? _checksumController.text
                          : null,
                      startDate: _startDateController.text.isNotEmpty
                          ? DateTime.parse(_startDateController.text)
                          : null,
                      endDate: _endDateController.text.isNotEmpty
                          ? DateTime.parse(_endDateController.text)
                          : null,
                      workingTime: _workingTimeController.text.isNotEmpty
                          ? double.parse(_workingTimeController.text)
                          : null,
                      estimatedTime: _estimatedTimeController.text.isNotEmpty
                          ? double.parse(_estimatedTimeController.text)
                          : null,
                      estimatedLeftTime:
                          _estimatedLeftTimeController.text.isNotEmpty
                              ? double.parse(_estimatedLeftTimeController.text)
                              : null,
                      workingProgress:
                          _workingProgressController.text.isNotEmpty
                              ? double.parse(_workingProgressController.text)
                              : null,
                      taskStatus: _taskStatusController.text.isNotEmpty
                          ? TaskStatus.values.firstWhere((e) =>
                              e.toString() ==
                              'TaskStatus.${_taskStatusController.text}')
                          : null,
                    );
                    BlocProvider.of<TaskBlocTask>(context)
                        .add(TaskAddBlocEvent(task));
                    Navigator.pop(context);
                  }
                },
                child: const Text('Add Task'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _subjectController.dispose();
    _checksumController.dispose();
    _startDateController.dispose();
    _endDateController.dispose();
    _workingTimeController.dispose();
    _estimatedTimeController.dispose();
    _estimatedLeftTimeController.dispose();
    _workingProgressController.dispose();
    _taskStatusController.dispose();
    super.dispose();
  }
}
