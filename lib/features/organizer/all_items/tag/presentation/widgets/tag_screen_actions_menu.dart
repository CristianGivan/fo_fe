import 'package:fo_fe/features/organizer/all_items/tag/utils/tag_exports.dart';
import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';

class TagScreenActionsMenu {
  static List<PopupMenuEntry> getMenuItems(BuildContext context) {
    return [
      PopupMenuItem(
        value: 'edit',
        child: Text('Edit Tag'),
        onTap: () => context.pushNamed(TagRouterNames.tagAddRouteName),
      ),
      PopupMenuItem(
        value: 'delete',
        child: Text('Delete Tag'),
      ),
    ];
  }
}
