import 'package:fo_fe/features/organizer/items/reminder/utils/reminder_exports.dart';
import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';

class ReminderManagementActionsPage extends StatelessWidget {
  final OrganizerItems<ReminderEntity> selectedReminders;

  ReminderManagementActionsPage({super.key, OrganizerItems<ReminderEntity>? selectedReminders})
      : selectedReminders = selectedReminders ?? OrganizerItems.empty();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildButtonRow(
            context,
            onPressed1: () => context.pushNamed(ReminderRouterNames.reminderAddRouteName),
            label1: 'Add Reminder',
            onPressed2: () {
              if (!selectedReminders.isEmpty) {
                context.pop(selectedReminders);
              }
            },
            label2: 'Link',
          ),
          const SizedBox(height: 16.0),
          _buildButtonRow(
            context,
            onPressed1: () => showFilterDialog(context),
            label1: 'Filter Reminders',
            onPressed2: () => showSortDialog(context),
            label2: 'Sort Reminders',
          ),
          const SizedBox(height: 16.0),
          _buildDescriptionInput(),
        ],
      ),
    );
  }

  // Helper method to build a row with two buttons
  Widget _buildButtonRow(
    BuildContext context, {
    required VoidCallback onPressed1,
    required String label1,
    required VoidCallback onPressed2,
    required String label2,
  }) {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
            onPressed: onPressed1,
            child: Text(label1),
          ),
        ),
        const SizedBox(width: 16.0),
        Expanded(
          child: ElevatedButton(
            onPressed: onPressed2,
            child: Text(label2),
          ),
        ),
      ],
    );
  }

  // Helper method to build the description input field
  Widget _buildDescriptionInput() {
    return const TextField(
      decoration: InputDecoration(
        labelText: 'Enter reminder description',
        border: OutlineInputBorder(),
      ),
    );
  }
}

// Placeholder functions for dialog actions
void showFilterDialog(BuildContext context) {
  // Implement the filter dialog for reminders
}

void showSortDialog(BuildContext context) {
  // Implement the sort dialog for reminders
}
