import 'package:fo_fe/features/organizer/all_items/task/utils/task_exports.dart';
import 'package:fo_fe/features/organizer/all_items/user/utils/user_exports.dart';
import 'package:fo_fe/features/organizer/presentation/bloc/organizer_link_bloc_event.dart';
import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';

class UpdateItemsOfItemActionsMenu<T extends OrganizerItemEntity> {
  static List<PopupMenuEntry> getMenuItems(BuildContext context, UpdateItemsOfItemParams params) {
    return [
      PopupMenuItem(
        child: Text('Add Items'),
        onTap: () => _updateItemsOfItem(context, params as UpdateItemsOfItemParams<UserEntity>),
      )
    ];
  }

  static void _updateItemsOfItem(BuildContext context, UpdateItemsOfItemParams params) {
    context.read<TaskUserLinkBloc>().add(UpdateItemsOfItemBlocEvent(params));
    context.pop();
  }
}
