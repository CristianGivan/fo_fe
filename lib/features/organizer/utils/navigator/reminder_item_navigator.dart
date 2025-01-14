// lib/utils/reminder_item_navigator.dart
import 'package:fo_fe/features/organizer/all_items/reminder/utils/reminder_exports.dart';
import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';

import 'base_item_navigator.dart';

class ReminderItemNavigator extends BaseItemNavigator<Reminder> {
  ReminderItemNavigator() : super(ReminderRouterNames.reminderRouteName);

  @override
  void updateItems(
    BuildContext context,
    int taskId,
    OrganizerItems<Reminder> items,
    OrganizerItems<Reminder> updatedItems,
  ) {
    context.read<ItemReminderLinkBloc>().add(GetItemsOfItemBlocEvent(ItemsLinkParamsFactory.create(
          id: taskId,
          itemType: ItemsTypeEnum.taskUser,
        )));
  }
}
