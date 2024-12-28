import 'package:fo_fe/core/db/drift/organizer_drift_exports.dart';
import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';

abstract class ReminderLocalDataSource {
  Future<int> addReminder(ReminderTableDriftCompanion reminderCompanion);

  Future<bool> updateReminder(ReminderTableDriftCompanion reminderCompanion);

  Future<int> deleteReminder(int reminderId);

  Future<ReminderTableDriftG?> getReminderById(int id);

  Future<List<ReminderTableDriftG>?> getReminderItemsAll();

  Future<List<ReminderTableDriftG?>?> getReminderItemsByIdSet(IdSet idSet);
}
