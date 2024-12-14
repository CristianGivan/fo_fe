import 'package:fo_fe/features/app_home/utils/app_home_exports.dart';
import 'package:fo_fe/features/organizer/items/task/presentation/widgets/task_edit_screen_actions_menu.dart';
import 'package:fo_fe/features/organizer/items/task/utils/task_exports.dart';
import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';

class TaskViewScreen extends StatelessWidget {
  final int taskId;

  const TaskViewScreen({super.key, required this.taskId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarPage(title: TaskStrings().screenViewTitle),
      body: BlocBuilder<TaskBloc, TaskBlocState>(
        builder: (context, state) {
          if (state is TaskLoadingBlocState) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is TaskLoadedBlocState) {
            final task = state.displayedTasks.getById(taskId);
            return _buildTaskView(context, task);
          } else {
            return Center(child: Text(TaskStrings().noItemsAvailable));
          }
        },
      ),
      bottomNavigationBar: AppBottomBarPage(
        leftMenuOptions: TaskEditScreenActionsMenu.getMenuItems(context),
        onSearchSubmitted: () {
          // Handle search action
        },
        rightMenuOptions: TaskEditScreenActionsMenu.getMenuItems(context),
      ),
    );
  }

  Widget _buildTaskView(BuildContext context, TaskEntity task) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Subject: ${task.subject}', style: const TextStyle(fontSize: 18)),
        const SizedBox(height: 10),
        Text('Start Date: ${task.startDate}'),
        Text('End Date: ${task.endDate}'),
        Text('Status: ${task.taskStatus}'),
        // Display other task details...
      ],
    );
  }
}
