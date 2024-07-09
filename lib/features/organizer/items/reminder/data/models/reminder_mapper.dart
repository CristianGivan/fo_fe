import 'package:drift/drift.dart';
import 'package:fo_fe/core/db/drift/organizer_drift_exports.dart';
import 'package:fo_fe/features/organizer/items/reminder/reminder_exports.dart';

class ReminderMapper {
  static ReminderModel toModel(ReminderTableDriftG reminderTable) {
    return ReminderModel(
      id: reminderTable.id,
      remindAt: reminderTable.remindAt,
    );
  }

  static ReminderModel entityToModel(ReminderEntity? reminderEntity) {
    if (reminderEntity == null) {
      return ReminderModel.empty();
    }
    return ReminderModel(
      id: reminderEntity.id,
      remindAt: reminderEntity.remindAt,
    );
  }

  static List<ReminderModel> entityListToModelList(
      List<ReminderEntity>? reminderEntityList) {
    if (reminderEntityList == null) {
      return [];
    }
    return reminderEntityList.map(entityToModel).toList();
  }

  static ReminderEntity modelToEntity(ReminderModel model) {
    return ReminderEntity(
      id: model.id,
      taskId: model.taskId,
      remindAt: model.remindAt,
    );
  }

  static List<ReminderEntity> modelListToEntityList(
      List<ReminderModel>? reminderModelList) {
    if (reminderModelList == null) {
      return [];
    }
    return reminderModelList.map(modelToEntity).toList();
  }

  static ReminderModel fromTableDrift(ReminderTableDriftG reminder) {
    return ReminderModel(
      id: reminder.id,
      remindAt: reminder.remindAt,
      // Add other fields
    );
  }

  static ReminderTableDriftCompanion modelToCompanion(ReminderModel reminder) {
    return ReminderTableDriftCompanion(
      id: Value(reminder.id),
      remindAt: Value(reminder.remindAt),
    );
  }

  static ReminderTableDriftCompanion entityToCompanion(ReminderEntity entity) {
    return ReminderTableDriftCompanion(
      id: Value(entity.id),
      remindAt: Value(entity.remindAt),
    );
  }
}
