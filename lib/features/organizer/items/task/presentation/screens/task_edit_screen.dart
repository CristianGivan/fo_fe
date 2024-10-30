import 'package:fo_fe/features/organizer/items/reminder/utils/reminder_exports.dart';
import 'package:fo_fe/features/organizer/items/tag/utils/tag_exports.dart';
import 'package:fo_fe/features/organizer/items/task/presentation/pages/task_edit_action_buttons_page.dart';
import 'package:fo_fe/features/organizer/items/task/presentation/pages/task_form_fields_page.dart';
import 'package:fo_fe/features/organizer/items/task/utils/other/task_navigator_helper.dart';
import 'package:fo_fe/features/organizer/items/task/utils/task_exports.dart';
import 'package:fo_fe/features/organizer/items/user/utils/user_exports.dart';
import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';

// Main TaskEditScreen with modular widgets
class TaskEditScreen extends StatefulWidget {
  final TaskEntity task;

  const TaskEditScreen({super.key, required this.task});

  @override
  _TaskEditScreenState createState() => _TaskEditScreenState();
}

class _TaskEditScreenState extends State<TaskEditScreen> with TaskDataLoaderMixin {
  @override
  Widget build(BuildContext context) {
    loadTaskData(context, widget.task.id);
    return Scaffold(
      appBar: AppBar(title: const Text('Edit Task')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TaskFormFieldsPage(task: widget.task),
            const SizedBox(height: 20),
            TaskEditActionButtonsPage(
              onSave: _handleSaveButtonPress,
              // onLinkTag: () =>
              //     _handleLinkPress<TagEntity>(context, TagRouterNames.tagRouteName, taskTagItems),
              // onLinkReminder: () => _handleLinkPress<ReminderEntity>(
              //     context, ReminderRouterNames.reminderRouteName, taskReminderItems),
              // onLinkUser: () => _handleLinkPress<UserEntity>(
              //     context, UserRouterNames.userRouteName, taskUserItems),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _handleLinkPress<T extends OrganizerItemEntity>(
      BuildContext context, String routeName, OrganizerItems<T> items) async {
    await TaskNavigatorHelper.handleNavigation(context, routeName, widget.task.id, items);
  }

  void _handleSaveButtonPress() {
    // Implement save logic here
  }
}

// Mixins for loading task data
mixin TaskDataLoaderMixin<T extends StatefulWidget> on State<T> {
  OrganizerItems<TagEntity> taskTagItems = OrganizerItems.empty();
  OrganizerItems<ReminderEntity> taskReminderItems = OrganizerItems.empty();
  OrganizerItems<UserEntity> taskUserItems = OrganizerItems.empty();

  void loadTaskData(BuildContext context, int taskId) {
    context.read<TaskTagLinkBloc>().add(GetTagItemsByTaskIdBlocEvent(taskId));
    context.read<TaskReminderLinkBloc>().add(GetReminderItemsByTaskIdBlocEvent(taskId));
    context.read<TaskUserLinkBloc>().add(GetUserItemsByTaskIdBlocEvent(taskId));
  }
}

// Helper class to handle navigation

// Modular TaskFormFields widget

// Reusable TaskItemList widget

// Modular ActionButtons widget

// Example content widget for item list
// class ItemListContent<T extends OrganizerItemEntity> extends StatelessWidget {
//   final OrganizerItems<T> items;
//
//   const ItemListContent({super.key, required this.items});
//
//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//       shrinkWrap: true,
//       itemCount: items.length,
//       itemBuilder: (context, index) {
//         final item = items[index];
//         return ListTile(title: Text(item.name));
//       },
//     );
//   }
