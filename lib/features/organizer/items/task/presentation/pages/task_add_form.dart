import 'package:fo_fe/features/organizer/items/task/utils/task_exports.dart';
import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';

class TaskAddForm extends StatelessWidget {
  final int loggedInUserId;

  TaskAddForm({super.key, required this.loggedInUserId});

  final _formKey = GlobalKey<FormState>();

  // Controllers
  final _subjectController = TextEditingController();
  final _checksumController = TextEditingController();
  final _startDateController = TextEditingController();
  final _endDateController = TextEditingController();
  final _workingTimeController = TextEditingController();
  final _estimatedTimeController = TextEditingController();
  final _estimatedLeftTimeController = TextEditingController();
  final _workingProgressController = TextEditingController();
  final _taskStatusController = TextEditingController();

  Future<void> _selectDateTime(BuildContext context, TextEditingController controller) async {
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

        controller.text = pickedDateTime.toIso8601String(); // Use a standardized format
      }
    }
  }

  Future<void> _navigateAndSelectUser(
      BuildContext context, ValueNotifier<String?> selectedUserNotifier) async {
    // TODO: Implement navigation and user selection
    // final String? selectedUser = await Navigator.push(
    //   context,
    //   MaterialPageRoute(builder: (_) => UserSelectionScreen()), // Replace with actual screen
    //   );
    //
    //   selectedUserNotifier.value = selectedUser;
  }

  void _saveTask(BuildContext context, ValueNotifier<String?> selectedUserNotifier) {
    if (_formKey.currentState?.validate() ?? false) {
      final task = TaskEntity(
        id: 0,
        subject: _subjectController.text,
        createdDate: DateTime.now(),
        creatorId: loggedInUserId,
        checksum: _checksumController.text.isNotEmpty ? _checksumController.text : null,
        startDate:
            _startDateController.text.isNotEmpty ? DateTime.parse(_startDateController.text) : null,
        endDate:
            _endDateController.text.isNotEmpty ? DateTime.parse(_endDateController.text) : null,
        workingTime: _workingTimeController.text.isNotEmpty
            ? double.parse(_workingTimeController.text)
            : null,
        estimatedTime: _estimatedTimeController.text.isNotEmpty
            ? double.parse(_estimatedTimeController.text)
            : null,
        estimatedLeftTime: _estimatedLeftTimeController.text.isNotEmpty
            ? double.parse(_estimatedLeftTimeController.text)
            : null,
        workingProgress: _workingProgressController.text.isNotEmpty
            ? double.parse(_workingProgressController.text)
            : null,
        taskStatus: _taskStatusController.text.isNotEmpty
            ? TaskStatus.values
                .firstWhere((e) => e.toString() == 'TaskStatus.${_taskStatusController.text}')
            : null,
      );

      BlocProvider.of<TaskBloc>(context).add(TaskAddBlocEvent(task));
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    final selectedUserNotifier = ValueNotifier<String?>(null);

    return Form(
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
          ValueListenableBuilder<String?>(
            valueListenable: selectedUserNotifier,
            builder: (context, selectedUser, _) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ElevatedButton(
                    onPressed: () => _navigateAndSelectUser(context, selectedUserNotifier),
                    child: const Text('Select User'),
                  ),
                  if (selectedUser != null)
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text('Selected User: $selectedUser'),
                    ),
                ],
              );
            },
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () => _saveTask(context, selectedUserNotifier),
            child: const Text('Save'),
          ),
        ],
      ),
    );
  }
}
