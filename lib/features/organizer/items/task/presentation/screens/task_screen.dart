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
      body: (context, userId) => _buildTaskList(userId, context),
      menuOptions: (context, userId) => TaskScreenActionsMenu.getMenuItems(context),
      onSearchSubmitted: () {
        // Define the search functionality here
      },
    );
  }

  Widget _buildTaskList(int userId, BuildContext context) {
    context.read<TaskBloc>().add(GetTaskItemsFromLogInUserBlocEvent(userId));
    return Column(
      children: [
        Expanded(
          child: TaskListPage(),
        ),
      ],
    );
  }
}
