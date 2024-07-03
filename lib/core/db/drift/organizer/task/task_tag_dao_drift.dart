import 'package:drift/drift.dart';
import 'package:fo_fe/core/db/drift/organizer_drift_exports.dart';

part 'task_tag_dao_drift.g.dart';

@DriftAccessor(tables: [TaskTagTableDrift])
class TaskTagDaoDrift extends DatabaseAccessor<OrganizerDriftDB>
    with _$TaskTagDaoDriftMixin {
  final OrganizerDriftDB db;

  TaskTagDaoDrift(this.db) : super(db);

  Future<List<TaskTagTableDriftG>> getAllTaskTags() =>
      select(taskTagTableDrift).get();

  Stream<List<TaskTagTableDriftG>> watchAllTaskTags() =>
      select(taskTagTableDrift).watch();

  Future<int> insertTaskTag(Insertable<TaskTagTableDriftG> taskTag) =>
      into(taskTagTableDrift).insert(taskTag);

  Future<bool> updateTaskTag(Insertable<TaskTagTableDriftG> taskTag) =>
      update(taskTagTableDrift).replace(taskTag);

  Future<int> deleteTaskTag(Insertable<TaskTagTableDriftG> taskTag) =>
      delete(taskTagTableDrift).delete(taskTag);

  Future<List<int>> getTagIdsByTaskId(int taskId) async {
    final result = await (select(taskTagTableDrift)
          ..where((tbl) => tbl.taskId.equals(taskId)))
        .get();
    return result.map((row) => row.tagId).toList();
  }
}
