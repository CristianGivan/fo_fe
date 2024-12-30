import 'package:fo_fe/core/widgets/pages/item_dto_list_view_page.dart';
import 'package:fo_fe/features/organizer/all_items/task/presentation/pages/task_card_page.dart';
import 'package:fo_fe/features/organizer/all_items/task/utils/task_exports.dart';
import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';

class TaskDeleteScreen extends StatelessWidget {
  const TaskDeleteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskBloc, OrganizerBlocState>(builder: (context, state) {
      return buildStateWidget(
        state: state,
        buildErrorState: _buildErrorState,
        buildLoadingState: _buildLoadingState,
        buildLoadedState: () => _buildTaskListDto(context, state.displayedItems),
      );
    });
  }

  Widget _buildErrorState(String? message) =>
      Center(child: Text(message ?? "Unknown error occurred"));

  Widget _buildLoadingState() => const Center(child: CircularProgressIndicator());

  Widget _buildTaskListDto(BuildContext context, OrganizerItems<ItemEntity> taskDtoList) {
    return ItemDtoListViewPage<TaskDto>(
      itemDtoList: taskDtoList,
      itemCardBuilder: (itemDto) => TaskCard(itemDto.task),
      getValue: _getValue,
      updateItemUserLink: _updateTaskUserLink,
    );
  }

  bool _getValue(TaskDto taskDto) {
    return taskDto.taskUserLink.isSelectedByUser;
  }

  void _updateTaskUserLink(BuildContext context, TaskDto taskDto, bool value) {
    final updatedTaskUserLink = taskDto.taskUserLink.copyWith(isSelectedByUser: value);
    context.read<TaskBloc>().add(UpdateTaskBlocEvent(TaskParams(
          taskDto: taskDto,
          taskUserLinkEntity: updatedTaskUserLink,
        )));
  }
}
