import 'package:fo_fe/features/authentication/utils/auth_exports.dart';
import 'package:fo_fe/features/organizer/all_items/task/utils/task_exports.dart';
import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';

class GetItems<T extends ItemEntity> {
  final BuildContext context;
  final ItemType itemsType;
  late final OrganizerItems<T> allItems;
  late final OrganizerItems<T> selectedItems;

  GetItems({
    required this.context,
    required this.itemsType,
  }) {
    getItems();
  }

  void getItems() {
    switch (itemsType) {
      case ItemType.taskUser:
        late final int loginUserId;
        final userUserDisplayedItems = OrganizerItems.empty();
        final taskUserDisplayedItems = context.read<TaskUserLinkBloc>().state.displayedItems;

        final state = context.read<AuthLogBloc>().state;
        if (state is AuthAuthenticatedBlocState) {
          loginUserId = state.userEntity.id;
        }

        if (userUserDisplayedItems.isEmpty) {
          allItems = taskUserDisplayedItems as OrganizerItems<T>;
        } else {
          allItems = userUserDisplayedItems as OrganizerItems<T>;
        }

        if (taskUserDisplayedItems.isEmpty) {
          selectedItems = OrganizerItems.empty();
        } else {
          selectedItems = taskUserDisplayedItems as OrganizerItems<T>;
        }

        break;
      case ItemType.taskTag:
        allItems = OrganizerItems.empty();
        selectedItems = OrganizerItems.empty();
        break;
      case ItemType.task:
        allItems = OrganizerItems.empty();
        selectedItems = OrganizerItems.empty();
        break;
      // Add other cases as needed
      case ItemType.undefine:
        // TODO: Handle this case.
        throw UnimplementedError();
      case ItemType.tag:
        // TODO: Handle this case.
        throw UnimplementedError();
      case ItemType.reminder:
        // TODO: Handle this case.
        throw UnimplementedError();
      case ItemType.user:
        // TODO: Handle this case.
        throw UnimplementedError();
      case ItemType.taskReminder:
        // TODO: Handle this case.
        throw UnimplementedError();
    }
  }
}
