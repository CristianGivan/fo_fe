import 'package:fo_fe/features/organizer/all_items/task/presentation/pages/task_card_page.dart';
import 'package:fo_fe/features/organizer/all_items/task/utils/task_exports.dart';
import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';

class TaskListPage extends StatelessWidget {
  const TaskListPage({super.key});

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
    if (taskDtoList.isEmpty) {
      return Center(child: Text(TaskStrings().noItemsToDisplay));
    } else {
      return ListView.builder(
          itemCount: taskDtoList.size(),
          itemBuilder: (context, index) => _buildCheckboxListTitle(taskDtoList, index, context));
    }
  }

  CheckboxListTile _buildCheckboxListTitle(
      OrganizerItems<ItemEntity> taskDtoList, int index, BuildContext context) {
    final taskDto = taskDtoList.getAt(index) as TaskDto;
    return CheckboxListTile(
      key: ValueKey(taskDto.id),
      title: TaskCard(taskDto.task),
      value: _getValue(taskDto),
      onChanged: (bool? value) {
        _updateTaskUserLink(context, taskDto, value!);
      },
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
