import 'package:fo_fe/core/widgets/core_widget_exports.dart';
import 'package:fo_fe/features/organizer/all_items/task/utils/task_exports.dart';
import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';

class TaskViewScreen extends StatelessWidget {
  final int taskId;

  const TaskViewScreen({super.key, required this.taskId});

  @override
  Widget build(BuildContext context) {
    return AppContentScreen(
      appBarTitle: TaskStrings().screenViewTitle,
      body: _buildStateWidget(),
      menuOptions: (context, userId) => TaskEditScreenActionsMenu.getMenuItems(context),
      onSearchSubmitted: () {
        // Define the search functionality here
      },
    );
  }

  _buildStateWidget() {
    return BlocBuilder<TaskBloc, OrganizerBlocState>(
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
