import 'package:fo_fe/features/organizer/all_items/task/utils/task_exports.dart';
import 'package:fo_fe/features/organizer/all_items/user/utils/user_exports.dart';
import 'package:fo_fe/features/organizer/presentation/bloc/organizer_link_bloc_event.dart';

import '../../../../utils/organizer_exports.dart';

class TaskLinkUserPage extends StatefulWidget {
  final TaskEntity task;

  TaskLinkUserPage({super.key, required int taskId}) : task = TaskEntity(id: taskId);

  @override
  State<TaskLinkUserPage> createState() => _TaskLinkUserPageState();
}

class _TaskLinkUserPageState extends State<TaskLinkUserPage> {
  OrganizerItems<UserEntity> userItems = OrganizerItems.empty();

  @override
  Widget build(BuildContext context) {
    context
        .read<TaskUserLinkBloc>()
        .add(GetLinkItemsByItemIdBlocEvent(TaskParams(id: widget.task.id)));
    return BlocBuilder<TaskUserLinkBloc, OrganizerBlocState>(builder: (context, state) {
      return buildStateWidget(
        state: state,
        buildErrorState: _buildErrorState,
        buildLoadingState: _buildLoadingState,
        buildLoadedState: () => _buildItemsListPage(context, state.displayedItems),
      );
    });
  }

  Widget _buildErrorState(String? message) =>
      Center(child: Text(message ?? "Unknown error occurred"));

  Widget _buildLoadingState() => const Center(child: CircularProgressIndicator());

  Widget _buildItemsListPage(BuildContext context, OrganizerItems<ItemEntity> itemList) {
    return Container(child: Text('TaskLinkUserPage'));
    // return ItemListViewPage<UserEntity>(
    //   itemDtoList: itemList.convertTo<UserDto>(),
    //   itemCardBuilder: (userDto) => UserCard(userDto),
    //   getValue: _getValue,
    //   updateItemUserLink: _updateTaskUserLink,
    // );
  }

// return BlocBuilder<TaskUserLinkBloc, TaskUserLinkBlocState>(
//   builder: (context, state) {
//     if (state is TaskUserLoadingBlocState) {
//       return const Center(child: CircularProgressIndicator());
//     } else if (state is TaskUserLoadedBlocState) {
//       userItems = state.userItems;
//       return ItemWithItemsPage<TaskEntity, UserEntity>(
//         item: widget.task,
//         items: userItems,
//         type: ItemsTypeEnum.user,
//       );
//       // } else if (state is UserItemsUpdatedToTaskBlocState) {
//       //   userItems = state.userItemsUpdated;
//       //   return ItemWithItemsPage<TaskEntity, UserEntity>(
//       //     item: widget.task,
//       //     items: userItems,
//       //     type: ItemsTypeEnum.user,
//       //   );
//     } else if (state is TaskUserErrorBlocState) {
//       return Center(child: Text(state.message));
//     } else {
//       return const Center(child: Text('No Users Available'));
//     }
//   },
// );
}
