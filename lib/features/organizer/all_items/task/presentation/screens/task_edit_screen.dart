import 'package:fo_fe/features/app_home/presentation/pages/app_bottom_bar_same_menu.dart';
import 'package:fo_fe/features/app_home/utils/app_home_exports.dart';
import 'package:fo_fe/features/organizer/all_items/task/presentation/pages/task_form_fields_page.dart';
import 'package:fo_fe/features/organizer/all_items/task/presentation/widgets/task_edit_screen_actions_menu.dart';
import 'package:fo_fe/features/organizer/all_items/task/utils/task_exports.dart';
import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';

class TaskEditScreen extends StatelessWidget {
  final int taskId;

  const TaskEditScreen({super.key, required this.taskId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarPage(title: TaskStrings().screenEditTitle),
      body: BlocBuilder<TaskBloc, OrganizerBlocState>(
        builder: (context, state) {
          switch (state.status) {
            case OrganizerBlocStatus.loading:
              return _buildLoadingState();
            case OrganizerBlocStatus.loaded:
              return _buildEditPage(context, state);
            case OrganizerBlocStatus.error:
              return _buildErrorState(state.errorMessage);
            default:
              return _noStateAvailable();
          }
        },
      ),
      bottomNavigationBar: AppBottomBarSameMenu(
        menuOptions: TaskEditScreenActionsMenu.getMenuItems(context),
        onSearchSubmitted: () {
          // Handle search action
        },
      ),
    );
  }

  Widget _buildLoadingState() => const Center(child: CircularProgressIndicator());

  Widget _buildErrorState(String? message) =>
      Center(child: Text(message ?? "Unknown error occurred"));

  Widget _noStateAvailable() => Center(child: Text(TaskStrings().noItemsAvailable));

  Widget _buildEditPage(BuildContext context, OrganizerBlocState state) {
    final task = (state.displayedItems?.getById(taskId) as TaskDto).task;
    return TaskFormFieldsPage(task: task);
  }
}
