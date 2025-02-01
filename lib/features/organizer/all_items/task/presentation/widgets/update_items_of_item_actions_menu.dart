import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';

class UpdateItemsOfItemActionsMenu<T extends OrganizerItemEntity> {
  static List<PopupMenuEntry> getMenuItems<T extends ItemEntity>(
      BuildContext context, UpdateLinkParams<T> params, OrganizerLinkBloc<T> selectedItemsBloc) {
    switch (params.itemType) {
      case ItemsTypeEnum.taskUser:
        return _getTaskUserMenuItems<T>(context, params, selectedItemsBloc);
      case ItemsTypeEnum.taskTag:
        return _getTaskTagMenuItems<T>(context, params, selectedItemsBloc);
      case ItemsTypeEnum.taskReminder:
        return _getTaskReminderMenuItems<T>(context, params, selectedItemsBloc);
      default:
        return <PopupMenuEntry>[];
    }
  }

  static List<PopupMenuEntry> _getTaskUserMenuItems<T extends ItemEntity>(
      BuildContext context, UpdateLinkParams<T> params, OrganizerLinkBloc<T> selectedItemsBloc) {
    return [
      PopupMenuItem(
        child: Text('Create New Item'),
        onTap: () => context.pushNamed(params.pushCreateLinkItemRoute),
      ),
      PopupMenuItem(
        child: Text('Update with Items'),
        onTap: () => {selectedItemsBloc.add(UpdateItemsOfItemBlocEvent<T>(params)), context.pop()},
      ),
    ];
  }

  static List<PopupMenuEntry> _getTaskTagMenuItems<T extends ItemEntity>(
      BuildContext context, UpdateLinkParams<T> params, OrganizerLinkBloc<T> selectedItemsBloc) {
    print("dbg Used UpdateItemsOfItemActionsMenu: Using OrganizerLinkBloc<$T>: $selectedItemsBloc "
        "(Hash: ${identityHashCode(selectedItemsBloc)})");
    if (selectedItemsBloc.isClosed) {
      print(
          "dbg Error: Trying to use a closed Bloc! (Hash: ${identityHashCode(selectedItemsBloc)})");
      // return [];
    }
    return [
      PopupMenuItem(
        child: Text('Create New Item'),
        onTap: () => context.pushNamed(params.pushCreateLinkItemRoute),
      ),
      PopupMenuItem(
        child: Text('Update with Items'),
        onTap: () => {selectedItemsBloc.add(UpdateItemsOfItemBlocEvent<T>(params)), context.pop()},
      ),
    ];
  }

  static List<PopupMenuEntry> _getTaskReminderMenuItems<T extends ItemEntity>(
      BuildContext context, UpdateLinkParams<T> params, OrganizerLinkBloc<T> selectedItemsBloc) {
    return [
      PopupMenuItem(
        child: Text('Create New Item'),
        onTap: () => context.pushNamed(params.pushCreateLinkItemRoute),
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
