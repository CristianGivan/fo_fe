import 'package:drift/drift.dart';
import 'package:fo_fe/core/db/drift/organizer_drift_exports.dart';
import 'package:fo_fe/features/organizer/all_items/reminder/utils/reminder_exports.dart';
import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';

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

  static ReminderTableDriftCompanion entityToCompanion(ReminderEntity entity) {
    return ReminderTableDriftCompanion(
      id: entity.id == 0 ? const Value.absent() : Value(entity.id),
      createdDate: Value(entity.createdDate),
      creatorId: Value(entity.creatorId),
      remoteId: Value(entity.remoteId),
      lastUpdate: Value(entity.lastUpdate),
      lastAccessedDate: Value(entity.lastAccessedDate),
      remoteAccesses: Value(entity.remoteAccesses),
      accesses: Value(entity.accesses),
      checksum: Value(entity.checksum),
      subject: Value(entity.subject),
      remindAt: Value(entity.remindAt),
    );
  }
}
