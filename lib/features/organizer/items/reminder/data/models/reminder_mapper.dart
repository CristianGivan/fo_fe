import 'package:drift/drift.dart';
import 'package:fo_fe/core/db/drift/organizer_drift_exports.dart';
import 'package:fo_fe/features/organizer/items/organizer_item/config/organizer_item_export.dart';
import 'package:fo_fe/features/organizer/items/reminder/config/reminder_exports.dart';

class ReminderMapper {
  static ReminderModel modelFromTableDrift(ReminderTableDriftG reminderTable) {
    return ReminderModel(
      id: reminderTable.id,
      subject: reminderTable.subject,
      remindAt: reminderTable.remindAt,
    );
  }

  static OrganizerItems<ReminderModel> modelItemsFromTableDriftItems(
      List<ReminderTableDriftG>? items) {
    if (items == null) {
      return OrganizerItems.empty();
    }
    return OrganizerItems.of(items.map(modelFromTableDrift).toList());
  }

  static ReminderModel modelFromEntity(ReminderEntity? reminderEntity) {
    if (reminderEntity == null) {
      return ReminderModel.empty();
    }
    return ReminderModel(
      id: reminderEntity.id,
      subject: reminderEntity.subject,
      remindAt: reminderEntity.remindAt,
    );
  }

  static OrganizerItems<ReminderModel> entityListToModelList(
      OrganizerItems<ReminderEntity>? items) {
    if (items == null) {
      return OrganizerItems.empty();
    }
    return OrganizerItems.of(items.map(modelFromEntity).toList());
  }

  static ReminderEntity entityFromModel(ReminderModel model) {
    return ReminderEntity(
      id: model.id,
      subject: model.subject,
      remindAt: model.remindAt,
    );
  }

  static OrganizerItems<ReminderEntity> entityItemsFromTableDriftItems(
      List<ReminderTableDriftG>? items) {
    if (items == null) {
      return OrganizerItems.empty();
    }
    return OrganizerItems.of(items.map(modelFromTableDrift).toList());
  }

  static OrganizerItems<ReminderEntity> entityItemsFromModelItems(
      OrganizerItems<ReminderModel>? items) {
    if (items == null) {
      return OrganizerItems.empty();
    }
    return OrganizerItems.of(items.map(entityFromModel).toList());
  }

  static ReminderEntity entityFromTableDrift(
      ReminderTableDriftG reminderTable) {
    return ReminderEntity(
      id: reminderTable.id,
      subject: reminderTable.subject,
      remindAt: reminderTable.remindAt,
    );
  }

  static ReminderTableDriftCompanion tableDriftCompanionFromModel(
      ReminderModel reminder) {
    return ReminderTableDriftCompanion(
      id: Value(reminder.id),
      remindAt: Value(reminder.remindAt),
    );
  }

  static ReminderTableDriftCompanion tableDriftCompanionFromEntity(
      ReminderEntity entity) {
    return ReminderTableDriftCompanion(
      id: Value(entity.id),
      remindAt: Value(entity.remindAt),
    );
  }
}
