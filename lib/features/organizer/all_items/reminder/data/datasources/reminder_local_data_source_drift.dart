import 'package:fo_fe/core/db/drift/organizer_drift_exports.dart';
import 'package:fo_fe/features/organizer/all_items/reminder/utils/reminder_exports.dart';
import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';

class ReminderLocalDataSourceDrift implements ReminderLocalDataSource {
  final OrganizerDriftDB db;

  ReminderLocalDataSourceDrift({required this.db});

  @override
  Future<int> addReminder(ReminderTableDriftCompanion reminderCompanion) async {
    return await db.reminderDaoDrift.addReminder(reminderCompanion);
  }

  @override
  Future<bool> updateReminder(ReminderTableDriftCompanion reminderCompanion) async {
    return await db.reminderDaoDrift.updateReminder(reminderCompanion);
  }

  @override
  Future<int> deleteReminder(int reminderId) async {
    return await db.reminderDaoDrift.deleteReminder(reminderId);
  }

  @override
  Future<ReminderTableDriftG?> getReminderById(int id) async {
    return await db.reminderDaoDrift.getReminderById(id);
  }

  @override
  Future<List<ReminderTableDriftG>> getReminderItemsAll() async {
    return await db.reminderDaoDrift.getReminderItemsAll();
  }

  @override
  Future<List<ReminderTableDriftG>> getReminderItemsByIdSet(IdSet idSet) async {
    return await db.reminderDaoDrift.getReminderItemsByReminderIdSet(idSet.toSet());
  }
}
