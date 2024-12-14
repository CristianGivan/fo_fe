import 'package:fo_fe/features/app_home/utils/app_home_exports.dart';
import 'package:fo_fe/features/organizer/items/task/presentation/pages/task_form_fields_page.dart';
import 'package:fo_fe/features/organizer/items/task/presentation/widgets/task_edit_screen_actions_menu.dart';
import 'package:fo_fe/features/organizer/items/task/utils/task_exports.dart';
import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';

class TaskEditScreen extends StatelessWidget {
  final int taskId;

  const TaskEditScreen({super.key, required this.taskId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarPage(title: TaskStrings().screenEditTitle),
      body: BlocBuilder<TaskBloc, TaskBlocState>(
        builder: (context, state) {
          if (state is TaskLoadingBlocState) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is TaskLoadedBlocState) {
            final task = state.displayedTasks.getById(taskId);
            return TaskFormFieldsPage(task: task);
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
}
