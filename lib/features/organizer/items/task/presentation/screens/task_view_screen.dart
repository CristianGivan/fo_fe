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
      body: BlocBuilder<TaskBloc, OrganizerBlocState>(
        builder: (context, state) {
          if (state.status == OrganizerBlocStatus.loading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is TaskBlocState && state.status == OrganizerBlocStatus.loaded) {
            final taskDto = state.displayedItems?.getById(taskId) as TaskDto;
            return _buildTaskView(context, taskDto.task);
          } else {
            return Center(child: Text(TaskStrings().noItemsAvailable));
          }
        },
      ),
      bottomNavigationBar: AppBottomBarMenu(
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
