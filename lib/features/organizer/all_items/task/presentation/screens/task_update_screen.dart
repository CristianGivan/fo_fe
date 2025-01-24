import 'package:fo_fe/core/widgets/core_widget_exports.dart';
import 'package:fo_fe/features/organizer/presentation/pages/item_link/item_link_items_view_page.dart';
import 'package:fo_fe/features/organizer/all_items/tag/utils/tag_exports.dart';
import 'package:fo_fe/features/organizer/all_items/task/presentation/logic/task_link_bloc/task_link_bloc_factory.dart';
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
      body: (userId) => _buildEditPage(userId),
      // todo -refactor- why I can have just userId and
      // below not
      menuOptions: (context, userId) => TaskEditScreenActionsMenu.getMenuItems(context),
      onSearchSubmitted: () {},
    );
  }

  Widget _buildEditPage(int userId) {
    final taskTagParams = ItemsLinkParamsFactory.create(
        id: taskId, forUserId: userId, itemType: ItemsTypeEnum.taskTag);
    final taskUserParams = ItemsLinkParamsFactory.create(
        id: taskId, forUserId: userId, itemType: ItemsTypeEnum.taskUser);

    return Column(
      children: [
        TextField(
          decoration: const InputDecoration(labelText: 'Task ID: '),
          controller: TextEditingController(text: taskId.toString()),
        ),
        BlocProvider(
          create: (context) => createTaskLinkBloc<TagEntity>(taskTagParams.itemType),
          child: ItemLinkItemsViewPage<TagEntity>(
            key: ValueKey("task_tag_$taskId"),
            params: taskTagParams,
          ),
        ),
        BlocProvider(
          create: (context) => createTaskLinkBloc<UserEntity>(taskUserParams.itemType),
          child: ItemLinkItemsViewPage<UserEntity>(
            key: ValueKey("task_user_$taskId"),
            params: taskUserParams,
          ),
        ),
      ],
    );
  }
}
