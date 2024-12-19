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
          return _buildTaskList(context, state.displayedTasks);
        } else if (state is TaskLoadedDtoBlocState) {
          return _buildTaskListDto(context, state.displayedTasks);
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

//todo -improve- this
  Widget _buildTaskList(BuildContext context, OrganizerItems<TaskEntity> tasks) {
    if (tasks.isEmpty) {
      return _buildEmptyState();
    } else {
      return ListView.builder(
        itemCount: tasks.size(),
        itemBuilder: (context, index) {
          final task = tasks.getAt(index);
          return BlocBuilder<TaskBloc, TaskBlocState>(
            builder: (context, state) {
              if (state is TaskLoadedBlocState) {
                final isSelected = state.selectedTasks.contains(task.id);
                return CheckboxListTile(
                  title: TaskCard(task),
                  value: isSelected,
                  onChanged: (bool? value) {
                    context.read<TaskBloc>().add(ToggleTaskSelectionBlocEvent(task.id));
                  },
                );
              }
              return const SizedBox.shrink();
            },
          );
        },
      );
    }
  }

  Widget _buildTaskListDto(BuildContext context, OrganizerItems<ItemEntity> taskDtoList) {
    if (taskDtoList.isEmpty) {
      return _buildEmptyState();
    } else {
      return ListView.builder(
        itemCount: taskDtoList.size(),
        itemBuilder: (context, index) {
          final taskDto = taskDtoList.getAt(index) as TaskDto;
          return BlocBuilder<TaskBloc, TaskBlocState>(
            builder: (context, state) {
              if (state is TaskLoadedDtoBlocState) {
                final isSelected = taskDto.taskUserLink.isSelectedByUser;
                return CheckboxListTile(
                  title: TaskCard(taskDto.task),
                  value: isSelected,
                  onChanged: (bool? value) {
                    final updatedTaskUserLink =
                        taskDto.taskUserLink.copyWith(selectedByUser: value!);
                    context.read<TaskBloc>().add(UpdateTaskUserLinkBlocEvent(TaskParams(
                        taskDto: taskDto.copyWith(taskUserLink: updatedTaskUserLink),
                        taskUserLinkEntity: updatedTaskUserLink)));
                  },
                );
              }
              return const SizedBox.shrink();
            },
          );
        },
      );
    }
  }

  void _handleTaskDtoSelectionChange(BuildContext context, TaskDto taskDto, bool? value) {
    final updatedTaskUserLink = taskDto.taskUserLink.copyWith(selectedByUser: value!);
    context.read<TaskBloc>().add(UpdateTaskUserLinkBlocEvent(TaskParams(
          taskDto: taskDto.copyWith(taskUserLink: updatedTaskUserLink),
          taskUserLinkEntity: updatedTaskUserLink,
        )));
  }

  Widget _buildTaskCheckboxListTile(
    BuildContext context, {
    required TaskEntity task,
    required bool isSelected,
    required ValueChanged<bool?> onChanged,
  }) {
    return CheckboxListTile(
      title: TaskCard(task),
      value: isSelected,
      onChanged: onChanged,
    );
  }
}
