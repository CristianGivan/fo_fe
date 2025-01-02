import 'package:fo_fe/core/widgets/core_widget_exports.dart';
import 'package:fo_fe/features/organizer/all_items/task/presentation/widgets/task_screen_actions_menu.dart';
import 'package:fo_fe/features/organizer/all_items/task/utils/task_exports.dart';
import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';

class TaskScreen extends StatelessWidget {
  const TaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppContentScreen(
      fetchItemsForLoggedInUser: _getTaskItemsFromLoggedInUser,
      appBarTitle: TaskStrings().screenTitle,
      body: TaskListPage(),
      menuOptions: (context, userId) => TaskScreenActionsMenu.getMenuItems(context),
      onSearchSubmitted: () {
        // Define the search functionality here
      },
    );
  }

  void _getTaskItemsFromLoggedInUser(BuildContext context, int userId) {
    context
        .read<TaskBloc>()
        .add(GetItemsFromLogInUserBlocEvent<TaskDto, TaskParams>(TaskParams(forUserId: userId)));
  }
}
