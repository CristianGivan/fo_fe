import 'package:drift/drift.dart';
import 'package:fo_fe/core/db/drift/organizer_drift_exports.dart';

part 'task_user_link_dao_drift.g.dart';

@DriftAccessor(tables: [TaskUserLinkTableDrift])
class TaskUserLinkDaoDrift extends DatabaseAccessor<OrganizerDriftDB>
    with _$TaskUserLinkDaoDriftMixin {
  final OrganizerDriftDB db;

  TaskUserLinkDaoDrift(this.db) : super(db);

  Future<List<TaskUserLinkTableDriftG>> getAllTaskUsers() => select(taskUserLinkTableDrift).get();

  Stream<List<TaskUserLinkTableDriftG>> watchAllTaskUsers() =>
      select(taskUserLinkTableDrift).watch();

  Future<int> addTaskUser(Insertable<TaskUserLinkTableDriftG> taskUser) =>
      into(taskUserLinkTableDrift).insert(taskUser);

  Future<bool> updateTaskUserLink(Insertable<TaskUserLinkTableDriftG> taskUser) =>
      update(taskUserLinkTableDrift).replace(taskUser);

  Future<int> deleteTaskUserByTaskId(int taskId) async {
    return (delete(taskUserLinkTableDrift)..where((tbl) => tbl.taskId.equals(taskId))).go();
  }

  Future<int> deleteTaskUser(int taskId, int userId) async {
    return (delete(taskUserLinkTableDrift)
          ..where((tbl) => tbl.taskId.equals(taskId) & tbl.userId.equals(userId)))
        .go();
  }

  Future<Set<int>> getUserIdsByTaskId(int taskId) async {
    final result =
        await (select(taskUserLinkTableDrift)..where((tbl) => tbl.taskId.equals(taskId))).get();
    return result.map((row) => row.userId).toSet();
  }

  Future<Set<int>> getTaskIdsByUserId(int userId) async {
    final result =
        await (select(taskUserLinkTableDrift)..where((tbl) => tbl.userId.equals(userId))).get();
    return result.map((row) => row.taskId).toSet();
  }

  Future<TaskUserLinkTableDriftG?> getTaskUserById(int id) async {
    return await (select(taskUserLinkTableDrift)..where((tbl) => tbl.id.equals(id))).getSingle();
  }
}
