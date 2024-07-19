import 'package:fo_fe/core/util/organizer/core_util_organizer.dart';
import 'package:fo_fe/features/organizer/items/reminder/reminder_exports.dart';

abstract class ReminderLocalDataSource {
  Future<int> insertReminder(ReminderEntity reminder);

  Future<bool> updateReminder(ReminderEntity reminder);

  Future<int> deleteReminder(int reminderId);

  Future<ReminderEntity> getReminderById(int id);

  Future<OrganizerItems<ReminderEntity>> getReminderItemsAll();

  Future<OrganizerItems<ReminderEntity>> getReminderItemsByIdSet(IdSet idSet);
}
