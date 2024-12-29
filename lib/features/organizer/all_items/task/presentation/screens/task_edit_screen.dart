import 'package:fo_fe/features/authentication/presentation/widget/auth_content_screen.dart';
import 'package:fo_fe/features/organizer/all_items/task/presentation/pages/task_form_fields_page.dart';
import 'package:fo_fe/features/organizer/all_items/task/presentation/widgets/task_edit_screen_actions_menu.dart';
import 'package:fo_fe/features/organizer/all_items/task/utils/task_exports.dart';
import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';

class TaskEditScreen extends StatelessWidget {
  final int taskId;

  const TaskEditScreen({super.key, required this.taskId});

  @override
  Widget build(BuildContext context) {
    return AuthContentScreen(
      appBarTitle: TaskStrings().screenEditTitle,
      body: _buildStateWidget(),
      menuOptions: (context, userId) => TaskEditScreenActionsMenu.getMenuItems(context),
      onSearchSubmitted: () {
        // Define the search functionality here
      },
    );
  }

  Widget _buildStateWidget() {
    return BlocBuilder<TaskBloc, OrganizerBlocState>(builder: (context, state) {
      return buildStateWidget(
        state: state,
        buildErrorState: _buildErrorState,
        buildLoadingState: _buildLoadingState,
        buildLoadedState: () => _buildEditPage(context, state),
      );
    });
  }

  Widget _buildErrorState(String? message) =>
      Center(child: Text(message ?? "Unknown error occurred"));

  Widget _buildLoadingState() => const Center(child: CircularProgressIndicator());

  Widget _buildEditPage(BuildContext context, OrganizerBlocState state) {
    final task = (state.displayedItems.getById(taskId) as TaskDto).task;
    return TaskFormFieldsPage(task: task);
  }
}
