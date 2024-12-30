import 'package:fo_fe/core/widgets/core_widget_exports.dart';
import 'package:fo_fe/features/organizer/all_items/task/utils/task_exports.dart';
import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';

import '../../../features/organizer/all_items/task/presentation/pages/task_card_page.dart';
import '../../../features/organizer/presentation/bloc/organizer_bloc.dart';

class GenericBlocBuilderWidget extends StatelessWidget {
  final BlocBuilder<OrganizerBloc, OrganizerBlocState> blocBuilder;
  final void Function(BuildContext, TaskDto, bool) _updateTaskUserLink;

  const GenericBlocBuilderWidget({
    super.key,
    required this.blocBuilder,
    required void Function(BuildContext, TaskDto, bool) updateTaskUserLink,
  }) : _updateTaskUserLink = updateTaskUserLink;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        blocBuilder,
        ElevatedButton(
          onPressed: () => _updateTaskUserLink(context, TaskDto as TaskDto, true),
          // Adjust parameters as needed
          child: Text('Update Task User Link'),
        ),
      ],
    );
  }

  Widget _buildErrorState(String? message) =>
      Center(child: Text(message ?? "Unknown error occurred"));

  Widget _buildLoadingState() => const Center(child: CircularProgressIndicator());

  Widget _buildTaskListDto(BuildContext context, OrganizerItems<ItemEntity> taskDtoList) {
    return ItemDtoListViewPage<TaskDto>(
      itemDtoList: taskDtoList as OrganizerItems<TaskDto>,
      itemCardBuilder: (itemDto) => TaskCard(itemDto.task),
      getValue: _getValue,
      updateItemUserLink: _updateTaskUserLink,
    );
  }

  bool _getValue(TaskDto taskDto) {
    return taskDto.taskUserLink.isSelectedByUser;
  }
}
