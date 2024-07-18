import 'package:drift/drift.dart';
import 'package:fo_fe/core/db/drift/organizer/task/task_reminder_table_drift.dart';
import 'package:fo_fe/core/db/drift/organizer_drift_exports.dart';

part 'task_reminder_dao_drift.g.dart';

@DriftAccessor(tables: [TaskReminderTableDrift])
class TaskReminderDaoDrift extends DatabaseAccessor<OrganizerDriftDB>
    with _$TaskReminderDaoDriftMixin {
  final OrganizerDriftDB db;

  TaskReminderDaoDrift(this.db) : super(db);

  Future<List<TaskReminderTableDriftG>> getAllTaskReminders() =>
      select(taskReminderTableDrift).get();

  Stream<List<TaskReminderTableDriftG>> watchAllTaskReminders() =>
      select(taskReminderTableDrift).watch();

  Future<int> insertTaskReminder(
          Insertable<TaskReminderTableDriftG> taskReminder) =>
      into(taskReminderTableDrift).insert(taskReminder);

  Future<bool> updateTaskReminder(
          Insertable<TaskReminderTableDriftG> taskReminder) =>
      update(taskReminderTableDrift).replace(taskReminder);

  Future<int> deleteTaskReminderByTaskId(int taskId) async {
    return (delete(taskReminderTableDrift)
          ..where((tbl) => tbl.taskId.equals(taskId)))
        .go();
  }

  Future<int> deleteTaskReminder(int taskId, int reminderId) async {
    return (delete(taskReminderTableDrift)
          ..where((tbl) =>
              tbl.taskId.equals(taskId) & tbl.reminderId.equals(reminderId)))
        .go();
  }

  Future<Set<int>> getReminderIdsByTaskId(int taskId) async {
    //todo cg
    final result = await (select(taskReminderTableDrift)
          ..where((tbl) => tbl.taskId.equals(taskId)))
        .get();
    return result.map((row) => row.reminderId).toSet();
  }
}
