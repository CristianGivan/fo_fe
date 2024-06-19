import 'package:drift/drift.dart';
import 'package:fo_fe/core/db/drift_sqlite/organizer_drift_db.dart';
import 'package:fo_fe/features/organizer/items/task/data/drift/datasourece/task_table_drift.dart';
import 'package:fo_fe/features/organizer/items/task/data/drift/models/task_model_drift.dart';

import '../../../task_lib.dart';

part 'task_dao_drift.g.dart';

@DriftAccessor(tables: [TaskTableDrift])
class TaskDaoDrift extends DatabaseAccessor<OrganizerDriftDB>
    with _$TaskDaoDriftMixin {
  final OrganizerDriftDB db;

  TaskDaoDrift(this.db) : super(db);

  // Example: Query to get all tasks
  Future<List<TaskTableDriftGen>> getAllTasks() => select(taskTableDrift).get();

  Future<void> createTask(TaskEntity task) =>
      into(taskTableDrift).insert(task.toCompanion());

  // Example: Insert a new task
  Future<int> insertTask(TaskEntity task) {
    return into(taskTableDrift).insert(task.toCompanion());
  }

  Future<void> updateTask(TaskTableDriftCompanion task) =>
      update(taskTableDrift).replace(task);

  Future<void> deleteTask(int taskId) =>
      (delete(taskTableDrift)..where((t) => t.id.equals(taskId))).go();
}
