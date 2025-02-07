import 'package:fo_fe/core/widgets/core_widget_exports.dart';
import 'package:fo_fe/features/organizer/all_items/task/presentation/pages/task_add_form.dart';
import 'package:fo_fe/features/organizer/utils/other/item_type/items_link_params/item_link_params.dart';

import '../../../../../../core/utils/exports/external_exports.dart';
import '../../utils/task_exports.dart';

class TaskAddScreen extends StatelessWidget {
  final ItemLinkParams itemLinkParams;

  const TaskAddScreen(this.itemLinkParams, {super.key});

  @override
  Widget build(BuildContext context) {
    return AppContentScreen(
      appBarTitle: TaskStrings().screenAddTitle,
      body: (userId) => TaskAddForm(userId: userId, itemLinkParams: itemLinkParams),
      menuOptions: (context, userId) => TaskAddScreenActionsMenu.getMenuItems(context, userId),
      onSearchSubmitted: () {
        // Define the search functionality here
      },
    );
  }
}
