import 'package:fo_fe/core/widgets/core_widget_exports.dart';
import 'package:fo_fe/features/organizer/all_items/tag/utils/tag_exports.dart';
import 'package:fo_fe/features/organizer/all_items/task/presentation/logic/task_link_bloc/task_link_bloc_factory.dart';
import 'package:fo_fe/features/organizer/all_items/task/presentation/widgets/task_edit_screen_actions_menu.dart';
import 'package:fo_fe/features/organizer/all_items/task/utils/task_exports.dart';
import 'package:fo_fe/features/organizer/all_items/user/domain/entities/user_entity.dart';
import 'package:fo_fe/features/organizer/presentation/pages/item_link/item_link_entities_view_page.dart';
import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';

class TaskUpdateScreen extends StatelessWidget {
  final int taskId;

  const TaskUpdateScreen({super.key, required this.taskId});

  @override
  Widget build(BuildContext context) {
    return AppContentScreen(
      appBarTitle: TaskStrings().screenEditTitle,
      body: (userId) => _buildEditPage(userId),
      menuOptions: (context, userId) => TaskEditScreenActionsMenu.getMenuItems(context),
      onSearchSubmitted: () {},
    );
  }

  Widget _buildEditPage(int userId) {
    return Column(
      children: [
        TextField(
          decoration: const InputDecoration(labelText: 'Task ID: '),
          controller: TextEditingController(text: taskId.toString()),
        ),
        BlocProvider(
          create: (context) => TaskLinksBlocFactory.createFor<TagEntity>(),
          child: _buildLinkEntityBlocProvider<TagEntity>(userId),
        ),
        BlocProvider(
          create: (context) => TaskLinksBlocFactory.createFor<UserEntity>(),
          child: _buildLinkEntityBlocProvider<UserEntity>(userId),
        ),
      ],
    );
  }

  Widget _buildLinkEntityBlocProvider<T extends ItemEntity>(int userId) {
    final params = TaskLinkParamsFactory.create<T>(id: taskId, forUserId: userId);
    return ItemLinkEntitiesViewPage<T>(params: params);
  }
}
