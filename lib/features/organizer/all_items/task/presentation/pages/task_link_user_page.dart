import 'package:fo_fe/core/widgets/pages/link_item_list_view_page.dart';
import 'package:fo_fe/features/organizer/all_items/task/utils/task_exports.dart';
import 'package:fo_fe/features/organizer/presentation/bloc/organizer_link_bloc_event.dart';

import '../../../../utils/organizer_exports.dart';

class TaskLinkUserPage<T extends OrganizerItemEntity> extends StatelessWidget {
  final int taskId;

  const TaskLinkUserPage({super.key, required this.taskId});

  @override
  Widget build(BuildContext context) {
    final taskUserLinkBloc = context.read<TaskUserLinkBloc>();
    if (taskUserLinkBloc.state.status != OrganizerBlocStatus.loaded) {
      taskUserLinkBloc.add(GetItemsOfItemBlocEvent(TaskParams(id: taskId)));
    }
    return BlocBuilder<TaskUserLinkBloc, OrganizerBlocState>(builder: (context, state) {
      return buildStateWidget(
        state: state,
        buildErrorState: _buildErrorState,
        buildLoadingState: _buildLoadingState,
        buildLoadedState: () =>
            _buildItemsListPage(context, state.displayedItems as OrganizerItems<T>),
      );
    });
  }

  Widget _buildErrorState(String? message) =>
      Center(child: Text(message ?? "Unknown error occurred"));

  Widget _buildLoadingState() => const Center(child: CircularProgressIndicator());

  Widget _buildItemsListPage(BuildContext context, OrganizerItems<T> items) {
    return Column(
      children: [
        if (items.isEmpty)
          Center(child: Text('No Available'))
        else
          LinkItemListViewPage<T>(itemList: items),
        ElevatedButton(
          onPressed: () =>
              context.pushNamed(TaskRouterNames.taskUpdateUserRouteName, extra: taskId),
          child: Text('Update'),
        ),
      ],
    );
  }
}
