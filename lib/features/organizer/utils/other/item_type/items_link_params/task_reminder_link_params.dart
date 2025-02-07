import 'package:fo_fe/features/organizer/all_items/reminder/utils/reminder_exports.dart';
import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';

class TaskReminderLinkParams extends ItemLinkParams {
  TaskReminderLinkParams({
    required int id,
    int forUserId = 0,
    required String pushUpdateRoute,
  }) : super(
          itemId: id,
          userId: forUserId,
          itemType: ItemsTypeEnum.taskReminder,
          pushUpdateRoute: pushUpdateRoute,
          pushCreateLinkItemRoute: ReminderRouterNames.reminderAddRouteName,
        );
}
