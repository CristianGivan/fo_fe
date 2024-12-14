import 'package:fo_fe/features/app_home/utils/app_home_exports.dart';
import 'package:fo_fe/features/authentication/presentation/widget/auth_content_widget.dart';
import 'package:fo_fe/features/authentication/utils/auth_exports.dart';
import 'package:fo_fe/features/organizer/items/task/presentation/widgets/task_screen_actions_menu.dart';
import 'package:fo_fe/features/organizer/items/task/utils/task_exports.dart';
import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';

class TaskScreen extends StatelessWidget {
  const TaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarPage(title: TaskStrings().screenTitle),
      body: AuthenticatedContentWidget(
        contentBuilder: _buildTaskList,
      ),
      bottomNavigationBar: AppBottomBarPage(
        leftMenuOptions: TaskScreenActionsMenu.getMenuItems(context),
        onSearchSubmitted: () {},
        rightMenuOptions: TaskScreenActionsMenu.getMenuItems(context),
      ),
    );
  }

  Column _buildTaskList(AuthAuthenticatedBlocState state, BuildContext context) {
    final userId = state.userEntity.id;
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
