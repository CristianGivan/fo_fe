import 'package:fo_fe/features/organizer/items/task/utils/task_exports.dart';
import 'package:fo_fe/features/organizer/items/user/utils/user_exports.dart';
import 'package:fo_fe/features/organizer/presentation/pages/item_with_items_page.dart';

import '../../../../utils/organizer_exports.dart';

class TaskLinkUserPage extends StatefulWidget {
  final TaskEntity task;

  const TaskLinkUserPage({super.key, required this.task});

  @override
  State<TaskLinkUserPage> createState() => _TaskLinkUserPageState();
}

class _TaskLinkUserPageState extends State<TaskLinkUserPage> {
  OrganizerItems<UserEntity> userItems = OrganizerItems.empty();

  @override
  Widget build(BuildContext context) {
    context.read<TaskUserLinkBloc>().add(GetUserItemsByTaskIdBlocEvent(widget.task.id));
    return BlocBuilder<TaskUserLinkBloc, TaskUserLinkBlocState>(
      builder: (context, state) {
        if (state is TaskUserLoadingBlocState) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is TaskUserLoadedBlocState) {
          userItems = state.userItems;
          return ItemWithItemsPage<TaskEntity, UserEntity>(
            item: widget.task,
            items: userItems,
            type: ItemsTypeEnum.user,
          );
        } else if (state is UserItemsUpdatedToTaskBlocState) {
          userItems = state.userItemsUpdated;
          return ItemWithItemsPage<TaskEntity, UserEntity>(
            item: widget.task,
            items: userItems,
            type: ItemsTypeEnum.user,
          );
        } else if (state is TaskUserErrorBlocState) {
          return Center(child: Text(state.message));
        } else {
          return const Center(child: Text('No Users Available'));
        }
      },
    );
  }
}
