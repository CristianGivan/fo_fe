import 'package:fo_fe/features/organizer/items/reminder/utils/reminder_exports.dart';
import 'package:fo_fe/features/organizer/items/task/utils/task_exports.dart';
import 'package:fo_fe/features/organizer/presentation/pages/item_with_items_page.dart';
import 'package:fo_fe/features/organizer/utils/other/items_type_selection.dart';

import '../../../../utils/organizer_exports.dart';

class TaskLinkReminderPage extends StatefulWidget {
  final TaskEntity task;

  const TaskLinkReminderPage({super.key, required this.task});

  @override
  State<TaskLinkReminderPage> createState() => _TaskLinkReminderPageState();
}

class _TaskLinkReminderPageState extends State<TaskLinkReminderPage> {
  OrganizerItems<ReminderEntity> reminderItems = OrganizerItems.empty();

  @override
  Widget build(BuildContext context) {
    context.read<TaskReminderLinkBloc>().add(GetReminderItemsByTaskIdBlocEvent(widget.task.id));
    return BlocBuilder<TaskReminderLinkBloc, TaskReminderLinkBlocState>(
      builder: (context, state) {
        if (state is TaskReminderLoadingBlocState) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is TaskReminderLoadedBlocState) {
          reminderItems = state.reminderItems;
          return ItemWithItemsPage<TaskEntity, ReminderEntity>(
            item: widget.task,
            items: reminderItems,
            type: ItemsTypeEnum.reminder,
          );
        } else if (state is ReminderItemsUpdatedToTaskBlocState) {
          reminderItems = state.reminderItemsUpdated;
          return ItemWithItemsPage<TaskEntity, ReminderEntity>(
            item: widget.task,
            items: reminderItems,
            type: ItemsTypeEnum.reminder,
          );
        } else if (state is TaskReminderErrorBlocState) {
          return Center(child: Text(state.message));
        } else {
          return const Center(child: Text('No Reminders Available'));
        }
      },
    );
  }
}
