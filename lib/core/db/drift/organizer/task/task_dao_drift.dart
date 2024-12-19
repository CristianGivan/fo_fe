import 'package:drift/drift.dart';

import '../../organizer_drift_exports.dart';

part 'task_dao_drift.g.dart';

@DriftAccessor(tables: [TaskTableDrift])
class TaskDaoDrift extends DatabaseAccessor<OrganizerDriftDB> with _$TaskDaoDriftMixin {
  final OrganizerDriftDB db;

  TaskDaoDrift(this.db) : super(db);

  Future<TaskTableDriftG?> getTaskById(int id) =>
      (select(taskTableDrift)..where((tbl) => tbl.id.equals(id))).getSingleOrNull();

  Future<List<TaskTableDriftG>> getTaskItemsAll() => select(taskTableDrift).get();

  Future<List<TaskTableDriftG>> getTaskItemsFromUser(int userId) => select(taskTableDrift).get();

  Future<List<TaskTableDriftG?>?> getTaskItemsByIdSet(Set<int> ids) =>
      (select(taskTableDrift)..where((tbl) => tbl.id.isIn(ids))).get();

  Stream<List<TaskTableDriftG>> watchTaskItemsAll() => select(taskTableDrift).watch();

  Future<int> addTask(Insertable<TaskTableDriftG> task) => into(taskTableDrift).insert(task);

  Future<bool> updateTask(Insertable<TaskTableDriftG> task) => update(taskTableDrift).replace(task);

  Future<int> deleteTask(int id) =>
      (delete(taskTableDrift)..where((tbl) => tbl.id.equals(id))).go();

  Future<List<QueryRow>?> getTaskDtoItemsFromUser(int userId) async {
    final query = customSelect(
      'SELECT task_table_drift.*, task_user_link_table_drift.* '
      'FROM task_table_drift '
      'LEFT OUTER JOIN task_user_link_table_drift '
      'ON task_user_link_table_drift.task_id = task_table_drift.id '
      'AND task_user_link_table_drift.user_id = ?',
      variables: [Variable.withInt(userId)],
    );

    final result = await query.get();
    return result;
  }
}
