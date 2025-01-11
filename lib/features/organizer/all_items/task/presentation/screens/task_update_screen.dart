import 'package:fo_fe/core/widgets/core_widget_exports.dart';
import 'package:fo_fe/core/widgets/pages/item_link_items_page.dart';
import 'package:fo_fe/features/organizer/all_items/tag/utils/tag_exports.dart';
import 'package:fo_fe/features/organizer/all_items/task/presentation/widgets/task_edit_screen_actions_menu.dart';
import 'package:fo_fe/features/organizer/all_items/task/utils/task_exports.dart';
import 'package:fo_fe/features/organizer/all_items/user/utils/user_exports.dart';
import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';

class TaskUpdateScreen extends StatelessWidget {
  final int taskId;

  const TaskUpdateScreen({super.key, required this.taskId});

  @override
  Widget build(BuildContext context) {
    return AppContentScreen(
      appBarTitle: TaskStrings().screenEditTitle,
      body: _buildEditPage(),
      menuOptions: (context, userId) => TaskEditScreenActionsMenu.getMenuItems(context),
      onSearchSubmitted: () {},
    );
  }

  Widget _buildEditPage() {
    final taskTagParams =
        ItemsLinkParamsFactory.create(id: taskId, itemType: ItemsTypeEnum.taskTag);
    final taskUserParams =
        ItemsLinkParamsFactory.create(id: taskId, itemType: ItemsTypeEnum.taskUser);
    return Column(
      children: [
        TextField(
          decoration: const InputDecoration(labelText: 'Task ID: '),
          controller: TextEditingController(text: taskId.toString()),
        ),
        ItemLinkItemsPage<TagEntity>(
            key: ValueKey("task_tag_$taskId"),
            params: ItemParams(id: taskId, itemType: ItemsTypeEnum.taskTag)),
        // TaskLinkReminderPage(taskId: taskId),
        ItemLinkItemsPage<UserEntity>(
          key: ValueKey("task_user_$taskId"),
          params: ItemParams(id: taskId, itemType: ItemsTypeEnum.taskUser),
        ),
      ],
    );
  }
}
