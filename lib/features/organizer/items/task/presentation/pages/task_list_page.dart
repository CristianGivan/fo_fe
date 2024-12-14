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

  Widget _buildEmptyState() => Center(child: Text(TaskStrings().noItemsToDisplay));

  Widget _buildTaskList(BuildContext context, OrganizerItems<TaskEntity> tasks) {
    if (tasks.isEmpty) {
      return _buildEmptyState();
    } else {
      return ListView.builder(
        itemCount: tasks.size(),
        itemBuilder: (context, index) {
          final task = tasks.getAt(index);
          return _buildTaskCard(context, task);
        },
      );
    }
  }

  Widget _buildTaskCard(BuildContext context, TaskEntity task) {
    return TaskCard(
      task: task,
      onViewTask: () => context.pushNamed(TaskRouterNames.taskViewRouteName, extra: task.id),
      onEditTask: () => context.pushNamed(TaskRouterNames.taskEditRouteName, extra: task.id),
    );
  }
}
