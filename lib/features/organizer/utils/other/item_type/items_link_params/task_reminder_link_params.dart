import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';

class TaskReminderLinkParams extends ItemsLinkParams {
  TaskReminderLinkParams({
    required int id,
    IdSet? idSet,
    int forUserId = 0,
    required String pushUpdateRoute,
  }) : super(
          id: id,
          idSet: idSet,
          forUserId: forUserId,
          itemType: ItemsTypeEnum.taskReminder,
          pushUpdateRoute: pushUpdateRoute,
        );
}
