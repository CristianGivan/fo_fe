import 'package:drift/drift.dart';

import '../../organizer_drift_exports.dart';

part 'task_dao_drift.g.dart';

@DriftAccessor(tables: [TaskTableDrift])
class TaskDaoDrift extends DatabaseAccessor<OrganizerDriftDB>
    with _$TaskDaoDriftMixin {
  final OrganizerDriftDB db;

  TaskDaoDrift(this.db) : super(db);

  // Example: Query to get all tasks
  Future<List<TaskTableDriftG>> getAllTasks() => select(taskTableDrift).get();

  // Example: Insert a new task
  Future<int> insertTask(TaskTableDriftCompanion task) {
    return into(taskTableDrift).insert(task);
  }

  Future<void> updateTask(TaskTableDriftCompanion task) =>
      update(taskTableDrift).replace(task);

  Future<void> deleteTask(int taskId) =>
      (delete(taskTableDrift)..where((t) => t.id.equals(taskId))).go();
}
