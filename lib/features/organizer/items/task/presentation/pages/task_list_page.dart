import 'package:fo_fe/features/organizer/items/task/presentation/pages/task_card_page.dart';
import 'package:fo_fe/features/organizer/items/task/utils/task_exports.dart';
import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';

class TaskListPage extends StatelessWidget {
  const TaskListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskBloc, TaskBlocState>(
      builder: (context, state) {
        if (state is TaskLoadingBlocState) {
          return _buildLoadingState();
        } else if (state is TaskLoadedBlocState) {
          return _buildErrorState(TaskStrings().noTaskDtoLoaded);
        } else if (state is TaskDtoItemsLoadedBlocState) {
          return _buildTaskListDto(context, state.displa9yedTasks);
        } else if (state is TaskErrorBlocState) {
          return _buildErrorState(state.message);
        } else {
          return _buildEmptyState();
        }
      },
    );
  }

  Widget _buildLoadingState() => const Center(child: CircularProgressIndicator());

  Widget _buildErrorState(String message) => Center(child: Text(message));

  Widget _buildEmptyState() => Center(child: Text(TaskStrings().noItemsToDisplay));

  Widget _buildTaskListDto(BuildContext context, OrganizerItems<ItemEntity> taskDtoList) {
    if (taskDtoList.isEmpty) {
      return _buildEmptyState();
    } else {
      return ListView.builder(
        itemCount: taskDtoList.size(),
        itemBuilder: (context, index) {
          final taskDto = taskDtoList.getAt(index) as TaskDto;
          return BlocBuilder<TaskUserLinkBloc, TaskUserLinkBlocState>(builder: (context, state) {
            return CheckboxListTile(
                title: TaskCard(taskDto.task),
                value: getValue(taskDto),
                onChanged: (bool? value) => updateTaskUserLink(context, taskDto, value!));
          });
        },
      );
    }
  }

  bool getValue(TaskDto taskDto) {
    return taskDto.taskUserLink.isSelectedByUser ?? false;
  }

  bool updateTaskUserLink(BuildContext context, TaskDto taskDto, bool value) {
    final updatedTaskUserLink = taskDto.taskUserLink.copyWith(selectedByUser: value!);
    context.read<TaskUserLinkBloc>().add(UpdateTaskUserLinkBlocEvent(updatedTaskUserLink));
    return value;
  }
}
