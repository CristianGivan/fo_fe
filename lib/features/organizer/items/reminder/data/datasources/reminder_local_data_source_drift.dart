import 'package:fo_fe/core/db/drift/organizer_drift_exports.dart';
import 'package:fo_fe/features/organizer/items/organizer_item/config/organizer_item_export.dart';
import 'package:fo_fe/features/organizer/items/reminder/config/reminder_exports.dart';

class ReminderLocalDataSourceDrift implements ReminderLocalDataSource {
  final OrganizerDriftDB db;

  ReminderLocalDataSourceDrift({required this.db});

  @override
  Future<int> insertReminder(ReminderEntity reminder) async {
    final reminderCompanion = ReminderMapper.entityToCompanion(reminder);
    return await db.reminderDaoDrift.insertReminder(reminderCompanion);
  }

  @override
  Future<bool> updateReminder(ReminderEntity reminder) async {
    final reminderCompanion = ReminderMapper.entityToCompanion(reminder);
    return await db.reminderDaoDrift.updateReminder(reminderCompanion);
  }

  @override
  Future<int> deleteReminder(int reminderId) async {
    return await db.reminderDaoDrift.deleteReminder(reminderId);
  }

  @override
  Future<ReminderEntity> getReminderById(int id) async {
    final reminder = await db.reminderDaoDrift.getReminderById(id);
    return reminder != null
        ? ReminderMapper.entityFromTableDrift(reminder)
        : ReminderEntity.empty();
  }

  @override
  Future<OrganizerItems<ReminderEntity>> getReminderItemsAll() async {
    final reminders = await db.reminderDaoDrift.getReminderItemsAll();
    return ReminderMapper.modelItemsFromTableDriftItems(reminders);
  }

  @override
  Future<OrganizerItems<ReminderEntity>> getReminderItemsByIdSet(
      IdSet idSet) async {
    final reminders = await db.reminderDaoDrift
        .getReminderItemsByReminderIdSet(idSet.toSet());
    return ReminderMapper.entityItemsFromTableDriftItems(reminders);
  }
}
