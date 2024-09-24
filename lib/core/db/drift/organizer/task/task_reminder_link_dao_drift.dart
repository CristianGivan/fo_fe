import 'package:drift/drift.dart';
import 'package:fo_fe/core/db/drift/organizer_drift_exports.dart';

part 'task_reminder_link_dao_drift.g.dart';

@DriftAccessor(tables: [TaskReminderLinkTableDrift])
class TaskReminderLinkDaoDrift extends DatabaseAccessor<OrganizerDriftDB>
    with _$TaskReminderLinkDaoDriftMixin {
  final OrganizerDriftDB db;

  TaskReminderLinkDaoDrift(this.db) : super(db);

  Future<List<TaskReminderTableDriftG>> getAllTaskReminders() =>
      select(taskReminderLinkTableDrift).get();

  Stream<List<TaskReminderTableDriftG>> watchAllTaskReminders() =>
      select(taskReminderLinkTableDrift).watch();

  Future<int> addTaskReminder(
          Insertable<TaskReminderTableDriftG> taskReminder) =>
      into(taskReminderLinkTableDrift).insert(taskReminder);

  Future<bool> updateTaskReminder(
          Insertable<TaskReminderTableDriftG> taskReminder) =>
      update(taskReminderLinkTableDrift).replace(taskReminder);

  Future<int> deleteTaskReminderByTaskId(int taskId) async {
    return (delete(taskReminderLinkTableDrift)
          ..where((tbl) => tbl.taskId.equals(taskId)))
        .go();
  }

  Future<int> deleteTaskReminder(int taskId, int reminderId) async {
    return (delete(taskReminderLinkTableDrift)
          ..where((tbl) =>
              tbl.taskId.equals(taskId) & tbl.reminderId.equals(reminderId)))
        .go();
  }

  Future<Set<int>> getReminderIdsByTaskId(int taskId) async {
    //todo cg
    final result = await (select(taskReminderLinkTableDrift)
          ..where((tbl) => tbl.taskId.equals(taskId)))
        .get();
    return result.map((row) => row.reminderId).toSet();
  }
}
