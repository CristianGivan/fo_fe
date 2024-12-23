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
        } else if (state is TaskDtoItemsLoadedBlocState) {
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

  Widget _buildTaskListDto(BuildContext context, OrganizerItems<ItemEntity> taskDtoList) {
    if (taskDtoList.isEmpty) {
      return _buildEmptyState();
    } else {
      return ListView.builder(
        itemCount: taskDtoList.size(),
        itemBuilder: (context, index) {
          final taskDto = taskDtoList.getAt(index) as TaskDto;

          return StreamBuilder<Map<int, bool>>(
            stream: context.read<TaskUserLinkBloc>().taskUpdatesStream,
            builder: (context, snapshot) {
              return CheckboxListTile(
                key: ValueKey(taskDto.id),
                title: TaskCard(taskDto.task),
                value: getValue(taskDto, snapshot),
                onChanged: (bool? value) => updateTaskUserLink(taskDto, value, context),
              );
            },
          );
        },
      );
    }
  }

  bool getValue(TaskDto taskDto, AsyncSnapshot<Map<int, bool>> snapshot) {
    bool isSelected = taskDto.taskUserLink.isSelectedByUser;

    if (snapshot.hasData && snapshot.data!.containsKey(taskDto.id)) {
      isSelected = snapshot.data![taskDto.id]!;
    }

    return isSelected;
  }

  void updateTaskUserLink(TaskDto taskDto, bool? value, BuildContext context) {
    final updatedTaskUserLink = taskDto.taskUserLink.copyWith(isSelectedByUser: value);
    context.read<TaskUserLinkBloc>().add(UpdateTaskUserLinkBlocEvent(updatedTaskUserLink));
  }
}
