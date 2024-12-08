import 'package:fo_fe/features/organizer/items/task/presentation/pages/task_card_page.dart';
import 'package:fo_fe/features/organizer/items/task/utils/task_exports.dart';
import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';

class TaskListPage extends StatelessWidget {
  const TaskListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskBloc, TaskBlocState>(
      builder: (context, state) {
        switch (state.runtimeType) {
          case TaskLoadingBlocState:
            return const Center(child: CircularProgressIndicator());
          case TaskLoadedBlocState:
            return _buildTaskList(context, (state as TaskLoadedBlocState).displayedTasks);
          case TaskErrorBlocState:
            return Center(child: Text((state as TaskErrorBlocState).message));
          default:
            return const Center(child: Text('No Tasks Available'));
        }
      },
    );
  }

  Widget _buildTaskList(BuildContext context, OrganizerItems<TaskEntity> tasks) {
    return ListView.builder(
      itemCount: tasks.size(),
      itemBuilder: (context, index) {
        final task = tasks.getAt(index);
        return _taskCardPage(context, task);
      },
    );
  }

  TaskCardPage _taskCardPage(BuildContext context, TaskEntity task) {
    return TaskCardPage(
      task: task,
      onUpdateTask: (updatedTask) => context.read<TaskBloc>().add(TaskUpdateBlocEvent(updatedTask)),
      onViewTask: () => context.pushNamed(TaskRouterNames.taskViewRouteName, extra: task),
      onEditTask: () => context.pushNamed(TaskRouterNames.taskEditRouteName, extra: task),
      onDeleteTask: (task) => context.read<TaskBloc>().add(TaskDeleteBlocEvent(task.id)),
    );
  }
}
