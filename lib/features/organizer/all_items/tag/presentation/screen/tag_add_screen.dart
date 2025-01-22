import 'package:fo_fe/core/widgets/core_widget_exports.dart';
import 'package:fo_fe/features/organizer/all_items/tag/utils/tag_exports.dart';
import 'package:fo_fe/features/organizer/all_items/task/presentation/widgets/task_add_screen_actions_menu.dart';

import '../../../../../../core/utils/exports/external_exports.dart';

class TagAddScreen extends StatelessWidget {
  const TagAddScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppContentScreen(
      appBarTitle: "AddTag",
      body: (userId) => TagAddForm(userId: userId),
      menuOptions: (context, userId) => TaskAddScreenActionsMenu.getMenuItems(context, userId),
      onSearchSubmitted: () {
        // Define the search functionality here
      },
    );
  }
}
