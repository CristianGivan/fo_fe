import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';

class GetItems<T extends ItemEntity> {
  final BuildContext context;
  final ItemsTypeEnum itemsType;
  late final OrganizerItems<T> allItems;
  late final OrganizerItems<T> selectedItems;

  GetItems({
    required this.context,
    required this.itemsType,
  }) {
    getItems();
  }

  void getItems() async {
    GetItemsFromLogInUserUseCase getItemsFromLogInUserUseCase;

    switch (itemsType) {
      case ItemsTypeEnum.taskUser:
        allItems = OrganizerItems.empty();
        selectedItems = OrganizerItems.empty();
        break;
      case ItemsTypeEnum.taskTag:
        allItems = OrganizerItems.empty();
        selectedItems = OrganizerItems.empty();
        break;
      case ItemsTypeEnum.task:
        allItems = OrganizerItems.empty();
        selectedItems = OrganizerItems.empty();
        break;
      // Add other cases as needed
      case ItemsTypeEnum.undefine:
        // TODO: Handle this case.
        throw UnimplementedError();
      case ItemsTypeEnum.tag:
        // TODO: Handle this case.
        throw UnimplementedError();
      case ItemsTypeEnum.reminder:
        // TODO: Handle this case.
        throw UnimplementedError();
      case ItemsTypeEnum.user:
        // TODO: Handle this case.
        throw UnimplementedError();
      case ItemsTypeEnum.taskReminder:
        // TODO: Handle this case.
        throw UnimplementedError();
    }
  }
}
