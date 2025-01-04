import 'package:fo_fe/core/widgets/pages/link_item_list_view_page.dart';
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
    return BlocBuilder<TaskUserLinkBloc, OrganizerBlocState<UserEntity>>(builder: (context, state) {
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

  Widget _buildItemsListPage(BuildContext context, OrganizerItems<UserEntity> items) {
    return Column(
      children: [
        if (items.isEmpty)
          Center(child: Text('No Available'))
        else
          LinkItemListViewPage<UserEntity>(itemList: items),
        ElevatedButton(
          onPressed: () => context.pop,
          child: Text('Update'),
        ),
      ],
    );
  }
}
