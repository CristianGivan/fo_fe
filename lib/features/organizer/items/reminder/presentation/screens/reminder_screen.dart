import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fo_fe/features/organizer/items/reminder/presentation/pages/reminder_list_page.dart';
import 'package:fo_fe/features/organizer/items/reminder/presentation/pages/reminder_management_actions_page.dart';
import 'package:fo_fe/features/organizer/items/reminder/utils/reminder_exports.dart';
import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';

class ReminderScreen extends StatefulWidget {
  final OrganizerItems<ReminderEntity> reminderItems;

  const ReminderScreen({super.key, required this.reminderItems});

  @override
  _ReminderScreenState createState() => _ReminderScreenState();
}

class _ReminderScreenState extends State<ReminderScreen> {
  late OrganizerItems<ReminderEntity> selectedReminderItems;

  @override
  void initState() {
    super.initState();
    selectedReminderItems = widget.reminderItems;
  }

  @override
  Widget build(BuildContext context) {
    _loadReminders(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Reminder Management')),
      body: Column(
        children: [
          const Center(child: Text('All Reminders:')),
          _buildReminderList(context),
          _buildReminderManagementActions(),
        ],
      ),
    );
  }

  void _loadReminders(BuildContext context) {
    context.read<ReminderBloc>().add(GetReminderItemsAllBlocEvent());
  }

  Widget _buildReminderList(BuildContext context) {
    return Expanded(
      child: ReminderListPage(
        onSelectReminder: (reminder) {
          setState(() {
            var builder = selectedReminderItems.toBuilder();
            builder.contains(reminder)
                ? builder.remove(reminder)
                : builder.add(reminder);
            selectedReminderItems = builder.build();
          });
        },
        selectedReminders: selectedReminderItems,
      ),
    );
  }

  Widget _buildReminderManagementActions() {
    return ReminderManagementActionsPage(
        selectedReminders: selectedReminderItems);
  }
}
