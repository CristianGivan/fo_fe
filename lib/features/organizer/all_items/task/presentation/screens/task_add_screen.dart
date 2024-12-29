import 'package:fo_fe/features/authentication/presentation/widget/auth_content_screen.dart';
import 'package:fo_fe/features/organizer/all_items/task/presentation/pages/task_add_form.dart';
import 'package:fo_fe/features/organizer/all_items/task/presentation/widgets/task_add_screen_actions_menu.dart';

import '../../../../../../core/utils/exports/external_exports.dart';
import '../../utils/task_exports.dart';

class TaskAddScreen extends StatelessWidget {
  const TaskAddScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthContentScreen(
      appBarTitle: TaskStrings().screenAddTitle,
      body: (userId) => TaskAddForm(userId: userId),
      menuOptions: (context, userId) => TaskAddScreenActionsMenu.getMenuItems(context, userId),
      onSearchSubmitted: () {
        // Define the search functionality here
      },
    );
  }
}
