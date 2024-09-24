import 'package:drift/drift.dart';

import '../../organizer_drift_exports.dart';

part 'reminder_dao_drift.g.dart';

@DriftAccessor(tables: [ReminderTableDrift])
class ReminderDaoDrift extends DatabaseAccessor<OrganizerDriftDB>
    with _$ReminderDaoDriftMixin {
  final OrganizerDriftDB db;

  ReminderDaoDrift(this.db) : super(db);

  Future<ReminderTableDriftG?> getReminderById(int id) =>
      (select(reminderTableDrift)..where((tbl) => tbl.id.equals(id)))
          .getSingleOrNull();

  Future<List<ReminderTableDriftG>> getReminderItemsAll() =>
      select(reminderTableDrift).get();

  Stream<List<ReminderTableDriftG>> watchReminderItemsAll() =>
      select(reminderTableDrift).watch();

  Future<int> addReminder(Insertable<ReminderTableDriftG> reminder) =>
      into(reminderTableDrift).insert(reminder);

  Future<bool> updateReminder(Insertable<ReminderTableDriftG> reminder) =>
      update(reminderTableDrift).replace(reminder);

  Future<int> deleteReminder(int id) =>
      (delete(reminderTableDrift)..where((tbl) => tbl.id.equals(id))).go();

  Future<List<ReminderTableDriftG>> getReminderItemsByReminderIdSet(
      Set<int> idSet) async {
    return (select(reminderTableDrift)..where((tbl) => tbl.id.isIn(idSet)))
        .get();
  }
}
