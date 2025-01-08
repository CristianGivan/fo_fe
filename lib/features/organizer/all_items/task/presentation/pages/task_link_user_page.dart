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
    //todo -refactor- add the event in buildStateWidget
    final taskUserLinkBloc = context.read<TaskUserLinkBloc>();
    //todo -update- maybe add also loading state in if
    if (taskUserLinkBloc.state.status != OrganizerBlocStatus.loaded) {
      taskUserLinkBloc.add(GetLinkItemsByItemIdBlocEvent(TaskParams(id: widget.task.id)));
    }
    return BlocBuilder<TaskUserLinkBloc, OrganizerBlocState>(builder: (context, state) {
      return buildStateWidget(
        state: state,
        buildErrorState: _buildErrorState,
        buildLoadingState: _buildLoadingState,
        buildLoadedState: () =>
            _buildItemsListPage(context, state.displayedItems as OrganizerItems<UserEntity>),
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
          onPressed: () =>
              context.pushNamed(TaskRouterNames.taskUpdateUserRouteName, extra: widget.task.id),
          child: Text('Update'),
        ),
      ],
    );
  }
}
