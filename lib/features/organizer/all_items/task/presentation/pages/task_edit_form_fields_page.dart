import 'package:fo_fe/features/organizer/all_items/task/presentation/pages/task_link_reminder_page.dart';
import 'package:fo_fe/features/organizer/all_items/task/presentation/pages/task_link_tag_page.dart';
import 'package:fo_fe/features/organizer/all_items/task/presentation/pages/task_link_user_page.dart';
import 'package:fo_fe/features/organizer/all_items/task/utils/task_exports.dart';

import '../../../../../../core/utils/exports/external_exports.dart';

class TaskEditFormFieldsPage extends StatelessWidget {
  final TaskEntity task;

  const TaskEditFormFieldsPage({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          decoration: const InputDecoration(labelText: 'Subject'),
          controller: TextEditingController(text: task.subject),
        ),
        TaskLinkTagPage(task: task),
        TaskLinkReminderPage(task: task),
        TaskLinkUserPage(task: task),
      ],
    );
  }
}
