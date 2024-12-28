import 'package:fo_fe/features/organizer/all_items/task/presentation/pages/task_card_page.dart';
import 'package:fo_fe/features/organizer/all_items/task/utils/task_exports.dart';
import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';

class TaskListPage extends StatelessWidget {
  const TaskListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskBloc, OrganizerBlocState>(
      builder: (context, state) {
        if (state.status == OrganizerBlocStatus.loading) {
          return _buildLoadingState();
        } else if (state.status == OrganizerBlocStatus.loaded) {
          return _buildTaskListDto(context, state.displayedItems);
        } else if (state.status == OrganizerBlocStatus.error) {
          return _buildErrorState(state.errorMessage);
        } else {
          return _buildEmptyState();
        }
      },
    );
  }

  Widget _buildLoadingState() => const Center(child: CircularProgressIndicator());

  Widget _buildErrorState(String? message) =>
      Center(child: Text(message ?? "Unknown error occurred"));

  Widget _buildEmptyState() => Center(child: Text(TaskStrings().noItemsToDisplay));

  Widget _buildTaskListDto(BuildContext context, OrganizerItems<ItemEntity> taskDtoList) {
    if (taskDtoList.isEmpty) {
      return _buildEmptyState();
    } else {
      return ListView.builder(
        itemCount: taskDtoList.size(),
        itemBuilder: (context, index) {
          final taskDto = taskDtoList.getAt(index) as TaskDto;
          return BlocBuilder<TaskUserLinkBloc, TaskUserLinkBlocState>(
            builder: (context, state) {
              return CheckboxListTile(
                key: ValueKey(taskDto.id),
                title: TaskCard(taskDto.task),
                value: getValue(taskDto),
                onChanged: (bool? value) {
                  updateTaskUserLink(context, taskDto, value!);
                },
              );
            },
          );
        },
      );
    }
  }

  bool getValue(TaskDto taskDto) {
    return taskDto.taskUserLink.isSelectedByUser;
  }

  void updateTaskUserLink(BuildContext context, TaskDto taskDto, bool value) {
    final updatedTaskUserLink = taskDto.taskUserLink.copyWith(isSelectedByUser: value);
    final updatedTaskDto = taskDto.copyWith(taskUserLink: updatedTaskUserLink);
    context.read<TaskUserLinkBloc>().add(UpdateTaskUserLinkBlocEvent(updatedTaskUserLink));
    context
        .read<TaskBloc>()
        .add(UpdateDisplayItemsWithItemBlocEvent(TaskParams(taskDto: updatedTaskDto)));
  }
}
