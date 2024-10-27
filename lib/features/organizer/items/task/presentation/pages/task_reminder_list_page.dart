import 'package:flutter/material.dart';
import 'package:fo_fe/features/organizer/items/reminder/utils/reminder_exports.dart';
import 'package:fo_fe/features/organizer/items/task/utils/task_exports.dart';
import 'package:fo_fe/features/organizer/presentation/pages/item_list_link_page.dart';
import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';
import 'package:fo_fe/features/organizer/utils/other/organizer_item_navigator.dart';

class TaskReminderListPage extends StatelessWidget {
  final OrganizerItems<ReminderEntity> reminderItems;
  final TaskEntity task;

  const TaskReminderListPage(
      {super.key, required this.reminderItems, required this.task});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ItemListLinkPage(
          items: reminderItems,
          itemTextBuilder: (reminder) => reminder.subject,
        ),
        ElevatedButton(
          onPressed: () => _handleUpdateReminderItems(context),
          child: const Text('Update Reminders'),
        ),
      ],
    );
  }

  Future<void> _handleUpdateReminderItems(BuildContext context) async {
    await OrganizerItemNavigator.navigateAndUpdateItems<ReminderEntity>(
      context,
      task.id,
      reminderItems,
      ReminderRouterNames.reminderRouteName,
    );
  }
}
