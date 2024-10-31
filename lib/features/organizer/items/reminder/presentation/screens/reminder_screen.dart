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
  late OrganizerItems<ReminderEntity> selectedItems;

  @override
  void initState() {
    super.initState();
    selectedItems = widget.reminderItems;
  }

  @override
  Widget build(BuildContext context) {
    _loadReminders(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Reminder Management'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            context.pop(selectedItems);
          },
        ),
      ),
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
            var builder = selectedItems.toBuilder();
            builder.contains(reminder) ? builder.remove(reminder) : builder.add(reminder);
            selectedItems = builder.build();
          });
        },
        selectedReminders: selectedItems,
      ),
    );
  }

  Widget _buildReminderManagementActions() {
    return ReminderManagementActionsPage(selectedReminders: selectedItems);
  }
}
