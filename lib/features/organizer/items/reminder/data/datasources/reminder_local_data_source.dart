import 'package:fo_fe/core/db/drift/organizer_drift_exports.dart';
import 'package:fo_fe/features/organizer/items/organizer_item/config/organizer_item_export.dart';
import 'package:fo_fe/features/organizer/items/reminder/config/reminder_exports.dart';

abstract class ReminderLocalDataSource {
  Future<int> insertReminder(ReminderEntity reminder);

  Future<bool> updateReminder(ReminderEntity reminder);

  Future<int> deleteReminder(int reminderId);

  Future<ReminderTableDriftG?> getReminderById(int id);

  Future<List<ReminderTableDriftG>?> getReminderItemsAll();

  Future<List<ReminderTableDriftG?>?> getReminderItemsByIdSet(IdSet idSet);
}
