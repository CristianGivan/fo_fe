import 'package:fo_fe/features/authentication/presentation/widget/auth_content_widget.dart';
import 'package:fo_fe/features/organizer/items/task/presentation/widgets/task_screen_actions_menu.dart';
import 'package:fo_fe/features/organizer/items/task/utils/task_exports.dart';
import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';

class TaskScreen extends StatelessWidget {
  const TaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthenticatedContentWidget(
      appBarTitle: TaskStrings().screenTitle,
      body: (context, userId) => _buildTaskList(context, userId),
      menuOptions: (context, userId) => TaskScreenActionsMenu.getMenuItems(context),
      onSearchSubmitted: () {
        // Define the search functionality here
      },
    );
  }

  Widget _buildTaskList(BuildContext context, int userId) {
    _getTaskItemsFromLoggedInUser(context, userId);
    return Column(
      children: [
        Expanded(
          child: TaskListPage(),
        ),
      ],
    );
  }

  void _getTaskItemsFromLoggedInUser(BuildContext context, int userId) {
    context.read<TaskBloc>().add(GetTaskItemsFromLogInUserBlocEvent(
        TaskParams(forUserId: userId, itemReturn: ItemReturn.dto)));
  }
}
