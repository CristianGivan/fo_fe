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

  Widget _buildEmptyState() => const Center(child: Text('No Tasks Available'));

  Widget _buildTaskList(BuildContext context, OrganizerItems<TaskEntity> tasks) {
    if (tasks.isEmpty) {
      _buildEmptyState();
    }
    return ListView.builder(
      itemCount: tasks.size(),
      itemBuilder: (context, index) {
        final task = tasks.getAt(index);
        return _buildTaskCard(context, task);
      },
    );
  }

  TaskCardPage _buildTaskCard(BuildContext context, TaskEntity task) {
    return TaskCardPage(
      task: task,
      onUpdateTask: (updatedTask) => context.read<TaskBloc>().add(TaskUpdateBlocEvent(updatedTask)),
      onViewTask: () => context.pushNamed(TaskRouterNames.taskViewRouteName, extra: task),
      onEditTask: () => context.pushNamed(TaskRouterNames.taskEditRouteName, extra: task),
      onDeleteTask: (task) => context.read<TaskBloc>().add(TaskDeleteBlocEvent(task.id)),
    );
  }
}
