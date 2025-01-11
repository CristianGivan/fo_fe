import 'package:fo_fe/features/organizer/all_items/task/utils/task_exports.dart';
import 'package:fo_fe/features/organizer/all_items/user/utils/config/user_route_names.dart';
import 'package:fo_fe/features/organizer/presentation/bloc/organizer_link_bloc_event.dart';
import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';

class UpdateItemsOfItemActionsMenu<T extends OrganizerItemEntity> {
  static List<PopupMenuEntry> getMenuItems(BuildContext context, UpdateItemsOfItemParams params) {
    switch (params.itemType) {
      case ItemsTypeEnum.taskUser:
        return _getTaskUserMenuItems(context, params);
      case ItemsTypeEnum.taskTag:
        return _getTaskTagMenuItems(context, params);
      case ItemsTypeEnum.taskReminder:
        return _getTaskReminderMenuItems(context, params);
      default:
        return <PopupMenuEntry>[];
    }
  }

  static _getTaskUserMenuItems(
      BuildContext context, UpdateItemsOfItemParams<OrganizerItemEntity> params) {
    return [
      PopupMenuItem(
        child: Text('Crate New Item'),
        onTap: () => context.pushNamed(UserRouterNames.userAddRouteName),
      ),
      PopupMenuItem(
        child: Text('Update with Items'),
        onTap: () => {
          context.read<TaskUserLinkBloc>().add(UpdateItemsOfItemBlocEvent(params)),
          context.pop()
        },
      )
    ];
  }

  static _getTaskTagMenuItems(
      BuildContext context, UpdateItemsOfItemParams<OrganizerItemEntity> params) {
    PopupMenuItem(
      child: Text('Add Items'),
      onTap: () {
        // context.read<TaskTagLinkBloc>().add(UpdateItemsOfItemBlocEvent(params));
        context.pop();
      },
    );
  }

  static _getTaskReminderMenuItems(
      BuildContext context, UpdateItemsOfItemParams<OrganizerItemEntity> params) {
    PopupMenuItem(
      child: Text('Add Items'),
      onTap: () {
        // context.read<TaskReminderLinkBloc>().add(UpdateItemsOfItemBlocEvent(params));
        context.pop();
      },
    );
  }
}
