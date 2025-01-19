import 'package:fo_fe/features/organizer/all_items/user/utils/user_exports.dart';
import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';

class UpdateItemsOfItemActionsMenu<T extends OrganizerItemEntity> {
  static List<PopupMenuEntry> getMenuItems(BuildContext context, UpdateLinkParams params) {
    switch (params.itemType) {
      case ItemsTypeEnum.taskUser:
        return _getTaskUserMenuItems(context, params);
      case ItemsTypeEnum.taskTag:
        return _getTaskTagMenuItems(context);
      case ItemsTypeEnum.taskReminder:
        return _getTaskReminderMenuItems(context);
      default:
        return <PopupMenuEntry>[];
    }
  }

  static _getTaskUserMenuItems(BuildContext context, UpdateLinkParams params) {
    return [
      PopupMenuItem(
        child: Text('Crate New Item'),
        onTap: () => context.pushNamed(UserRouterNames.userAddRouteName),
      ),
      PopupMenuItem(
        child: Text('Update with Items'),
        onTap: () => {
          context
              .read<TaskUserLinkBloc>()
              .add(UpdateItemsOfItemBlocEvent<UserEntity>(params as UpdateLinkParams<UserEntity>)),
          context.pop()
        },
      )
    ];
  }

  static _getTaskTagMenuItems(BuildContext context) {
    return [
      PopupMenuItem(
        child: Text('Add Items'),
        onTap: () {
          // context.read<TaskTagLinkBloc>().add(UpdateItemsOfItemBlocEvent(params));
          context.pop();
        },
      ),
    ];
  }

  static _getTaskReminderMenuItems(BuildContext context) {
    return [
      PopupMenuItem(
        child: Text('Add Items'),
        onTap: () {
          // context.read<TaskReminderLinkBloc>().add(UpdateItemsOfItemBlocEvent(params));
          context.pop();
        },
      )
    ];
  }
}
