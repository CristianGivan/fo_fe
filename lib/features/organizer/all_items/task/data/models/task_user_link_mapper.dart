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
}
