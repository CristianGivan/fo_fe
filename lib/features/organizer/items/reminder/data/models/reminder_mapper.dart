import 'package:drift/drift.dart';
import 'package:fo_fe/core/db/drift/organizer_drift_exports.dart';
import 'package:fo_fe/features/organizer/items/organizer_item/config/organizer_item_export.dart';
import 'package:fo_fe/features/organizer/items/reminder/config/reminder_exports.dart';

class ReminderMapper {
  static ReminderEntity entityFromTableDrift(
      ReminderTableDriftG reminderTable) {
    return ReminderEntity(
      id: reminderTable.id,
      subject: reminderTable.subject,
      remindAt: reminderTable.remindAt,
    );
  }

  static OrganizerItems<ReminderEntity> entityItemsFromTableDriftItems(
      List<ReminderTableDriftG> items) {
    return OrganizerItems.of(items.map(entityFromTableDrift).toList());
  }

  static ReminderTableDriftCompanion tableDriftCompanionFromEntity(
      ReminderEntity reminder) {
    return ReminderTableDriftCompanion(
      id: Value(reminder.id),
      remindAt: Value(reminder.remindAt),
    );
  }

  static ReminderTableDriftCompanion companionFromEntity(
      ReminderEntity entity) {
    return ReminderTableDriftCompanion(
      id: entity.id == 0 ? const Value.absent() : Value(entity.id),
      remindAt: Value(entity.remindAt),
    );
  }
}
