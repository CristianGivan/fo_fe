import 'package:fo_fe/core/db/drift/organizer_drift_exports.dart';
import 'package:fo_fe/features/organizer/items/organizer_item/config/organizer_item_export.dart';
import 'package:fo_fe/features/organizer/items/reminder/config/reminder_exports.dart';

class ReminderLocalDataSourceDrift implements ReminderLocalDataSource {
  final OrganizerDriftDB db;

  ReminderLocalDataSourceDrift({required this.db});

  @override
  Future<int> insertReminder(ReminderEntity reminder) async {
    final reminderCompanion = ReminderMapper.companionFromEntity(reminder);
    return await db.reminderDaoDrift.insertReminder(reminderCompanion);
  }

  @override
  Future<bool> updateReminder(ReminderEntity reminder) async {
    final reminderCompanion = ReminderMapper.companionFromEntity(reminder);
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
    return await db.reminderDaoDrift
        .getReminderItemsByReminderIdSet(idSet.toSet());
  }
}
