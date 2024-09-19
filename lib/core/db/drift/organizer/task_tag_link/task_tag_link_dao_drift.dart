import 'package:drift/drift.dart';
import 'package:fo_fe/core/db/drift/organizer_drift_exports.dart';

part 'task_tag_link_dao_drift.g.dart';

@DriftAccessor(tables: [TaskTagLinkTableDrift])
class TaskTagLinkDaoDrift extends DatabaseAccessor<OrganizerDriftDB>
    with _$TaskTagLinkDaoDriftMixin {
  final OrganizerDriftDB db;

  TaskTagLinkDaoDrift(this.db) : super(db);

  Future<List<TaskTagTableDriftG>> getAllTaskTags() =>
      select(taskTagLinkTableDrift).get();

  Stream<List<TaskTagTableDriftG>> watchAllTaskTags() =>
      select(taskTagLinkTableDrift).watch();

  Future<int> insertTaskTag(Insertable<TaskTagTableDriftG> taskTag) =>
      into(taskTagLinkTableDrift).insert(taskTag);

  Future<bool> updateTaskTag(Insertable<TaskTagTableDriftG> taskTag) =>
      update(taskTagLinkTableDrift).replace(taskTag);

  Future<int> deleteTaskTagByTaskId(int taskId) async {
    return (delete(taskTagLinkTableDrift)
          ..where((tbl) => tbl.taskId.equals(taskId)))
        .go();
  }

  Future<int> deleteTaskTag(int taskId, int tagId) async {
    return (delete(taskTagLinkTableDrift)
          ..where((tbl) => tbl.taskId.equals(taskId) & tbl.tagId.equals(tagId)))
        .go();
  }

  Future<Set<int>> getTagIdsByTaskId(int taskId) async {
    final result = await (select(taskTagLinkTableDrift)
          ..where((tbl) => tbl.taskId.equals(taskId)))
        .get();
    return result.map((row) => row.tagId).toSet();
  }
}
