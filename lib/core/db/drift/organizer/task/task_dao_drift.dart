import 'package:drift/drift.dart';
import 'package:fo_fe/core/util/organizer/core_util_organizer.dart';

import '../../organizer_drift_exports.dart';

part 'task_dao_drift.g.dart';

@DriftAccessor(tables: [TaskTableDrift])
class TaskDaoDrift extends DatabaseAccessor<OrganizerDriftDB>
    with _$TaskDaoDriftMixin {
  final OrganizerDriftDB db;

  TaskDaoDrift(this.db) : super(db);

  Future<TaskTableDriftG?> getTaskById(int id) =>
      (select(taskTableDrift)..where((tbl) => tbl.id.equals(id)))
          .getSingleOrNull();

  Future<List<TaskTableDriftG>> getTaskItemsAll() =>
      select(taskTableDrift).get();

  Future<List<TaskTableDriftG>> getTaskItemsByIdSet(IdSet idSet) =>
      (select(taskTableDrift)..where((tbl) => tbl.id.isIn(idSet.toSet())))
          .get();

  Future<int> insertTask(Insertable<TaskTableDriftG> task) =>
      into(taskTableDrift).insert(task);

  Future<bool> updateTask(Insertable<TaskTableDriftG> task) =>
      update(taskTableDrift).replace(task);

  Future<int> deleteTask(Insertable<TaskTableDriftG> task) =>
      delete(taskTableDrift).delete(task);

  Stream<List<TaskTableDriftG>> watchAllTasks() =>
      select(taskTableDrift).watch();
}
