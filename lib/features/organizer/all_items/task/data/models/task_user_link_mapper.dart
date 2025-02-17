import 'package:drift/drift.dart';
import 'package:fo_fe/core/db/drift/organizer_drift_exports.dart';
import 'package:fo_fe/features/organizer/all_items/task/domain/entities/task_user_entity.dart';

class TaskUserLinkMapper {
  static TaskUserLinkEntity entityFromTableDrift(TaskUserLinkTableDriftG table) {
    return TaskUserLinkEntity(
      id: table.id,
      linkingDate: table.linkingDate,
      taskId: table.taskId,
      userId: table.userId,
      selectedByUser: table.selectedByUser ?? false,
      orderedByUser: table.orderedByUser ?? 0,
    );
  }

  static TaskUserLinkTableDriftCompanion companionFromEntity(TaskUserLinkEntity entity) {
    return TaskUserLinkTableDriftCompanion(
      id: entity.id == 0 ? const Value.absent() : Value(entity.id),
      linkingDate: Value(entity.linkingDate ?? DateTime.now()),
      taskId: Value(entity.taskId ?? 0),
      userId: Value(entity.userId ?? 0),
      selectedByUser: Value(entity.isSelectedByUser ?? false),
      orderedByUser: Value(entity.orderedByUser),
    );
  }

  TaskUserLinkTableDriftCompanion _createSelectedTaskUserCompanion(int taskId, int userId) {
    return TaskUserLinkTableDriftCompanion(
      taskId: Value(taskId),
      userId: Value(userId),
      linkingDate: Value(DateTime.now()),
      selectedByUser: Value(true),
    );
  }

  static TaskUserLinkTableDriftCompanion entityToCompanion(TaskUserLinkEntity taskUserLink) {
    return TaskUserLinkTableDriftCompanion(
      id: taskUserLink.id == 0 ? const Value.absent() : Value(taskUserLink.id),
      linkingDate: Value(taskUserLink.linkingDate ?? DateTime.now()),
      taskId: Value(taskUserLink.taskId ?? 0),
      userId: Value(taskUserLink.userId ?? 0),
      selectedByUser: Value(taskUserLink.isSelectedByUser ?? false),
      orderedByUser: Value(taskUserLink.orderedByUser),
    );
  }

  static TaskUserLinkEntity rowToTaskUserEntity(QueryRow row) {
    return TaskUserLinkEntity(
      id: row.read<int>('id'),
      linkingDate: row.read<DateTime>('linking_date'),
      taskId: row.read<int>('task_id'),
      userId: row.read<int>('user_id'),
      selectedByUser: row.read<bool>('selected_by_user'),
      orderedByUser: row.read<int>('ordered_by_user'),
    );
  }
}
