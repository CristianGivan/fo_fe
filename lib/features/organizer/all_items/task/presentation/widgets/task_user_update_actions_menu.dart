import 'package:fo_fe/features/organizer/all_items/task/utils/task_exports.dart';
import 'package:fo_fe/features/organizer/all_items/user/utils/user_exports.dart';
import 'package:fo_fe/features/organizer/presentation/bloc/organizer_link_bloc_event.dart';
import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';

class TaskUserUpdateActionsMenu<T extends OrganizerItemEntity> {
  static List<PopupMenuEntry> getMenuItems(
      BuildContext context, UpdateLinkItemsOfItemParams params) {
    return [
      PopupMenuItem(
        child: Text('Add Users'),
        onTap: () => _updateItemsToTask(context, params as UpdateLinkItemsOfItemParams<UserEntity>),
      )
    ];
  }

  static void _updateItemsToTask(BuildContext context, UpdateLinkItemsOfItemParams params) {
    context.read<TaskUserLinkBloc>().add(UpdateLinkItemsOfItemBlocEvent(params));
    context.pop();
  }
}
