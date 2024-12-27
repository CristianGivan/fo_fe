import 'package:fo_fe/features/app_home/presentation/pages/app_bottom_bar_same_menu.dart';
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
      body: BlocBuilder<TaskBloc, OrganizerBlocState>(
        builder: (context, state) {
          if (state.status == OrganizerBlocStatus.loading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is TaskBlocState && state.status == OrganizerBlocStatus.loaded) {
            final taskDto = state.displayedItems.getById(taskId) as TaskDto;
            return TaskFormFieldsPage(task: taskDto.task);
          } else {
            return Center(child: Text(TaskStrings().noItemsAvailable));
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
}
