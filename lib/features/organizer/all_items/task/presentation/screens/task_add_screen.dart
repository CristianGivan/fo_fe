import 'package:fo_fe/core/widgets/core_widget_exports.dart';
import 'package:fo_fe/features/organizer/all_items/task/presentation/pages/task_add_form.dart';

import '../../../../../../core/utils/exports/external_exports.dart';
import '../../utils/task_exports.dart';

class TaskAddScreen extends StatelessWidget {
  const TaskAddScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppContentScreen(
      appBarTitle: TaskStrings().screenAddTitle,
      body: (userId) => TaskAddForm(userId: userId),
      menuOptions: (context, userId) => TaskAddScreenActionsMenu.getMenuItems(context, userId),
      onSearchSubmitted: () {
        // Define the search functionality here
      },
    );
  }
}
