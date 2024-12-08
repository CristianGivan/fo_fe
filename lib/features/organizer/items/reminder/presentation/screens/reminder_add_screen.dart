import 'package:fo_fe/core/utils/exports/external_exports.dart';
import 'package:fo_fe/core/widgets/core_widget_exports.dart';
import 'package:fo_fe/features/organizer/items/reminder/utils/reminder_exports.dart';

class ReminderAddScreen extends StatefulWidget {
  const ReminderAddScreen({super.key});

  @override
  _ReminderAddScreenState createState() => _ReminderAddScreenState();
}

class _ReminderAddScreenState extends State<ReminderAddScreen> {
  final TextEditingController _reminderNameController = TextEditingController();
  DateTime? _remindAt;
  TimeOfDay? _remindTime;

  @override
  void dispose() {
    _reminderNameController.dispose();
    super.dispose();
  }

  void _saveReminder(BuildContext context) {
    final String reminderName = _reminderNameController.text;

    if (reminderName.isNotEmpty && _remindAt != null) {
      final reminder = ReminderEntity(
        subject: reminderName,
        remindAt: _remindAt!, // Use the selected date
      );
      BlocProvider.of<ReminderBloc>(context).add(AddReminderBlocEvent(reminder));
    } else {
      SnackBarWidget.showAboveBottomNavBar(context,
          content: 'Please enter a title and select a date.');
    }
  }

  Future<void> _selectDateTime(BuildContext context) async {
    // First, pick the date
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: _remindAt ?? DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    );

    if (pickedDate != null) {
      // Then, pick the time
      final TimeOfDay? pickedTime = await showTimePicker(
        context: context,
        initialTime: _remindTime ?? TimeOfDay.now(),
      );

      if (pickedTime != null) {
        setState(() {
          // Combine date and time into a single DateTime
          _remindAt = DateTime(
            pickedDate.year,
            pickedDate.month,
            pickedDate.day,
            pickedTime.hour,
            pickedTime.minute,
          );
          _remindTime = pickedTime;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Reminder'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _reminderNameController,
              decoration: const InputDecoration(
                labelText: 'Reminder Title',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  _remindAt == null ? 'Select a Date' : 'Date: ${_remindAt!.toLocal()}',
                  // Display the selected date
                  style: const TextStyle(fontSize: 16),
                ),
                IconButton(
                  icon: const Icon(Icons.calendar_today),
                  onPressed: () => _selectDateTime(context), // Open the date picker
                ),
              ],
            ),
            const SizedBox(height: 16.0),
            BlocConsumer<ReminderBloc, ReminderBlocState>(
              listener: (context, state) {
                if (state is ReminderSuccessBlocState) {
                  SnackBarWidget.showAboveBottomNavBar(context,
                      content: 'Reminder saved successfully');
                  context.pop();
                } else if (state is ReminderErrorBlocState) {
                  SnackBarWidget.showAboveBottomNavBar(context, content: state.message);
                }
              },
              builder: (context, state) {
                if (state is ReminderLoadingBlocState) {
                  return const CircularProgressIndicator();
                }
                return SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () => _saveReminder(context),
                    child: const Text('Save Reminder'),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
