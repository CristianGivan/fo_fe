import 'package:fo_fe/features/organizer/items/task/presentation/logic/task_cubit/task_form_cubit.dart';
import 'package:fo_fe/features/organizer/items/task/utils/task_exports.dart';
import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';

class TaskAddForm extends StatelessWidget {
  final int userId;

  const TaskAddForm({super.key, required this.userId});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskFormCubit, TaskFormState>(
      builder: (context, state) {
        return Form(
          child: ListView(
            children: [
              TextFormField(
                decoration: const InputDecoration(labelText: 'Subject'),
                initialValue: state.subject,
                onChanged: (value) => context.read<TaskFormCubit>().updateSubject(value),
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'Please enter a subject';
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Checksum'),
                initialValue: state.checksum,
                onChanged: (value) => context.read<TaskFormCubit>().updateChecksum(value),
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Start Date'),
                readOnly: true,
                controller: TextEditingController(
                  text: state.startDate?.toIso8601String(),
                ),
                onTap: () => _selectDateTime(
                  context,
                  (date) => context.read<TaskFormCubit>().updateStartDate(date),
                ),
              ),
              // Add other fields following the same pattern...
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => _saveTask(context),
                child: const Text('Save'),
              ),
            ],
          ),
        );
      },
    );
  }

  void _saveTask(BuildContext context) {
    final formState = context.read<TaskFormCubit>().state;

    final task = TaskEntity(
      id: 0,
      subject: formState.subject,
      createdDate: DateTime.now(),
      creatorId: userId,
      checksum: formState.checksum.isNotEmpty ? formState.checksum : null,
      startDate: formState.startDate,
      endDate: formState.endDate,
      workingTime: formState.workingTime,
      estimatedTime: formState.estimatedTime,
      estimatedLeftTime: formState.estimatedLeftTime,
      workingProgress: formState.workingProgress,
      taskStatus: formState.taskStatus,
    );

    BlocProvider.of<TaskBloc>(context).add(AddItemBlocEvent(task));
    context.pop();
  }

  Future<void> _selectDateTime(BuildContext context, Function(DateTime) onUpdate) async {
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
        final pickedDateTime = DateTime(
          pickedDate.year,
          pickedDate.month,
          pickedDate.day,
          pickedTime.hour,
          pickedTime.minute,
        );
        onUpdate(pickedDateTime);
      }
    }
  }
}
