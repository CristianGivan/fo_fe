import 'package:fo_fe/features/authentication/presentation/widget/auth_content_widget.dart';
import 'package:fo_fe/features/organizer/items/task/presentation/pages/task_add_form.dart';
import 'package:fo_fe/features/organizer/items/task/presentation/widgets/task_add_screen_actions_menu.dart';

import '../../../../../../core/utils/exports/external_exports.dart';
import '../../utils/task_exports.dart';

class TaskAddScreen extends StatelessWidget {
  const TaskAddScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthenticatedContentWidget(
      appBarTitle: TaskStrings().screenAddTitle,
      body: (context, userId) => _buildTaskAddForm(userId, context),
      menuOptions: (context, userId) => TaskAddScreenActionsMenu.getMenuItems(context, userId),
      onSearchSubmitted: () {
        // Define the search functionality here
      },
    );
  }

  Widget _buildTaskAddForm(userId, BuildContext context) {
    return TaskAddForm(
      loggedInUserId: userId,
      onAddTask: (context, task) {
        BlocProvider.of<TaskBloc>(context).add(TaskAddBlocEvent(task));
        context.pop();
      },
    );
  }
}
