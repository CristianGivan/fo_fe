import 'package:drift/drift.dart';
import 'package:fo_fe/core/db/drift/organizer_drift_exports.dart';
import 'package:fo_fe/features/organizer/items/reminder/reminder_exports.dart';

class ReminderMapper {
  static ReminderModel toModel(ReminderTableDriftG reminderTable) {
    return ReminderModel(
      id: reminderTable.id,
      taskId: reminderTable.taskId,
      remindAt: reminderTable.remindAt,
    );
  }

  static ReminderModel entityToModel(ReminderEntity? reminderEntity) {
    if (reminderEntity == null) {
      return ReminderModel.empty();
    }
    return ReminderModel(
      id: reminderEntity.id,
      taskId: reminderEntity.taskId,
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

  static ReminderModel fromTableDrift(ReminderTableDriftG reminder) {
    return ReminderModel(
      id: reminder.id,
      taskId: reminder.taskId,
      remindAt: reminder.remindAt,
      // Add other fields
    );
  }

  static ReminderTableDriftCompanion toCompanion(ReminderModel reminder) {
    return ReminderTableDriftCompanion(
      id: Value(reminder.id),
      taskId: Value(reminder.taskId),
      remindAt: Value(reminder.remindAt),
    );
  }
}
