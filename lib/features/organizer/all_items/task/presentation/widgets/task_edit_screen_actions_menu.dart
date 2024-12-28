import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';

class TaskEditScreenActionsMenu {
  static List<PopupMenuEntry> getMenuItems(BuildContext context) {
    return [
      PopupMenuItem(
        child: Text('Save Task'),
        onTap: () => context.pop(),
      )
    ];
  }
}
