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
          switch (state.status) {
            case OrganizerBlocStatus.loading:
              return _buildLoadingState();
            case OrganizerBlocStatus.loaded:
              return _buildTaskView(context, state);
            case OrganizerBlocStatus.error:
              return _buildErrorState(state.errorMessage);
            default:
              return _noStateAvailable();
          }
        },
      ),
      bottomNavigationBar: AppBottomBarMenu(
        leftMenuOptions: TaskEditScreenActionsMenu.getMenuItems(context),
        onSearchSubmitted: () {},
        rightMenuOptions: TaskEditScreenActionsMenu.getMenuItems(context),
      ),
    );
  }

  Widget _buildLoadingState() => const Center(child: CircularProgressIndicator());

  Widget _buildErrorState(String? message) =>
      Center(child: Text(message ?? "Unknown error occurred"));

  Widget _noStateAvailable() => Center(child: Text(TaskStrings().noItemsAvailable));

  Widget _buildTaskView(BuildContext context, OrganizerBlocState state) {
    final task = (state.displayedItems?.getById(taskId) as TaskDto).task;
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
