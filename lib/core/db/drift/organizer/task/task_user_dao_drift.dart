import 'package:drift/drift.dart';
import 'package:fo_fe/core/db/drift/organizer_drift_exports.dart';
import 'package:fo_fe/core/util/organizer/core_util_organizer.dart';

part 'task_user_dao_drift.g.dart';

@DriftAccessor(tables: [TaskUserTableDrift])
class TaskUserDaoDrift extends DatabaseAccessor<OrganizerDriftDB>
    with _$TaskUserDaoDriftMixin {
  final OrganizerDriftDB db;

  TaskUserDaoDrift(this.db) : super(db);

  Future<List<TaskUserTableDriftG>> getAllTaskUsers() =>
      select(taskUserTableDrift).get();

  Stream<List<TaskUserTableDriftG>> watchAllTaskUsers() =>
      select(taskUserTableDrift).watch();

  Future<int> insertTaskUser(Insertable<TaskUserTableDriftG> taskUser) =>
      into(taskUserTableDrift).insert(taskUser);

  Future<bool> updateTaskUser(Insertable<TaskUserTableDriftG> taskUser) =>
      update(taskUserTableDrift).replace(taskUser);

  Future<int> deleteTaskUserByTaskId(int taskId) async {
    return (delete(taskUserTableDrift)
          ..where((tbl) => tbl.taskId.equals(taskId)))
        .go();
  }

  Future<int> deleteTaskUser(int taskId, int userId) async {
    return (delete(taskUserTableDrift)
          ..where(
              (tbl) => tbl.taskId.equals(taskId) & tbl.userId.equals(userId)))
        .go();
  }

  Future<IdSet> getUserIdsByTaskId(int taskId) async {
    final result = await (select(taskUserTableDrift)
          ..where((tbl) => tbl.taskId.equals(taskId)))
        .get();
    return IdSet.of(result.map((row) => row.userId).toList());
  }
}
