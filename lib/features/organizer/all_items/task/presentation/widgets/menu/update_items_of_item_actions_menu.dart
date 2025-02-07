import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';

class UpdateItemsOfItemActionsMenu<T extends OrganizerItemEntity> {
  static List<PopupMenuEntry> getMenuItems<T extends ItemEntity>(
      BuildContext context, UpdateLinkParams<T> params) {
    switch (params.itemType) {
      case ItemsTypeEnum.taskUser:
        return _getTaskUserMenuItems<T>(context, params);
      case ItemsTypeEnum.taskTag:
        return _getTaskTagMenuItems<T>(context, params);
      case ItemsTypeEnum.taskReminder:
        return _getTaskReminderMenuItems<T>(context, params);
      default:
        return <PopupMenuEntry>[];
    }
  }

  static List<PopupMenuEntry> _getTaskUserMenuItems<T extends ItemEntity>(
      BuildContext context, UpdateLinkParams<T> params) {
    return [
      PopupMenuItem(
        child: Text('Add New Item'),
        onTap: () =>
            context.pushNamed(params.pushCreateLinkItemRoute, extra: params.itemLinkParams),
      ),
      PopupMenuItem(
        child: Text('Update with Items'),
        onTap: () => {
          context
              .read<OrganizerLinkBloc<T>>()
              .add(UpdateItemsOfItemBlocEvent<T>(params.itemLinkIdsParams)),
          context.pop()
        },
      ),
    ];
  }

  static List<PopupMenuEntry> _getTaskTagMenuItems<T extends ItemEntity>(
      BuildContext context, UpdateLinkParams<T> params) {
    return [
      PopupMenuItem(
        child: Text('Add New Item'),
        onTap: () =>
            context.pushNamed(params.pushCreateLinkItemRoute, extra: params.itemLinkParams),
      ),
      PopupMenuItem(
        child: Text('Update with Items'),
        onTap: () => {
          context
              .read<OrganizerLinkBloc<T>>()
              .add(UpdateItemsOfItemBlocEvent<T>(params.itemLinkIdsParams)),
          context.pop()
        },
      ),
    ];
  }

  static List<PopupMenuEntry> _getTaskReminderMenuItems<T extends ItemEntity>(
      BuildContext context, UpdateLinkParams<T> params) {
    return [
      PopupMenuItem(
        child: Text('Add New Item'),
        onTap: () =>
            context.pushNamed(params.pushCreateLinkItemRoute, extra: params.itemLinkParams),
      ),
      PopupMenuItem(
        child: Text('Update with Items'),
        onTap: () {
          // context.read<TaskReminderLinkBloc>().add(UpdateItemsOfItemBlocEvent(params));
          context.pop();
        },
      ),
    ];
  }
}
