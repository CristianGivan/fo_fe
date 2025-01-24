import 'package:fo_fe/features/organizer/all_items/task/presentation/widgets/task_screen_actions_menu.dart';
import 'package:fo_fe/features/organizer/all_items/task/utils/task_exports.dart';
import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';

typedef GetMenuItemsFunction = List<PopupMenuEntry> Function(BuildContext context);

class ScreenActionMenu {
  static final Map<Type, GetMenuItemsFunction> typeToGetMenuItemsFunction = {
    TaskDto: (context) => TaskScreenActionsMenu.getMenuItems(context),
  };

  static List<PopupMenuEntry> getMenuItems(BuildContext context, Type type) {
    final getMenuItemsFunction = ScreenActionMenu.typeToGetMenuItemsFunction[type];
    if (getMenuItemsFunction != null) {
      return getMenuItemsFunction(context);
    } else {
      throw UnimplementedError('Menu items not implemented for type ${type.runtimeType}');
    }
  }
}
