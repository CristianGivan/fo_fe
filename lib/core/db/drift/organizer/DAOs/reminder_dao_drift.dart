import 'package:drift/drift.dart';

import '../../organizer_drift_exports.dart';

part 'reminder_dao_drift.g.dart';

@DriftAccessor(tables: [ReminderTableDrift])
class ReminderDaoDrift extends DatabaseAccessor<OrganizerDriftDB>
    with _$ReminderDaoDriftMixin {
  final OrganizerDriftDB db;

  ReminderDaoDrift(this.db) : super(db);

  Future<List<ReminderTableDriftG>> getAllReminders() =>
      select(reminderTableDrift).get();

  Stream<List<ReminderTableDriftG>> watchAllReminders() =>
      select(reminderTableDrift).watch();

  Future<int> insertReminder(Insertable<ReminderTableDriftG> reminder) =>
      into(reminderTableDrift).insert(reminder);

  Future<bool> updateReminder(Insertable<ReminderTableDriftG> reminder) =>
      update(reminderTableDrift).replace(reminder);

  Future<int> deleteReminder(Insertable<ReminderTableDriftG> reminder) =>
      delete(reminderTableDrift).delete(reminder);

  Future<List<ReminderTableDriftG>> getRemindersByTaskId(
          List<int> reminderIds) =>
      (select(reminderTableDrift)..where((tbl) => tbl.id.isIn(reminderIds)))
          .get();
}
