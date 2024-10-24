import 'package:drift/drift.dart';
import 'package:fo_fe/core/db/drift/organizer_drift_exports.dart';
import 'package:fo_fe/features/organizer/items/reminder/utils/reminder_exports.dart';
import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';

class ReminderMapper {
  static ReminderEntity entityFromTableDrift(ReminderTableDriftG reminderTable) {
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

  static ReminderTableDriftCompanion tableDriftCompanionFromEntity(ReminderEntity reminder) {
    return ReminderTableDriftCompanion(
      id: Value(reminder.id),
      remindAt: Value(reminder.remindAt),
    );
  }

  static ReminderTableDriftCompanion companionFromEntity(ReminderEntity entity) {
    return ReminderTableDriftCompanion(
      id: entity.id == 0 ? const Value.absent() : Value(entity.id),
      remindAt: Value(entity.remindAt),
    );
  }

  static ReminderTableDriftCompanion entityToCompanion(ReminderEntity reminder) {
    return ReminderTableDriftCompanion(
      id: Value(reminder.id),
      createdDate: Value(reminder.createdDate),
      creatorId: Value(reminder.creatorId),
      remoteId: Value(reminder.remoteId),
      lastUpdate: Value(reminder.lastUpdate),
      lastAccessedDate: Value(reminder.lastAccessedDate),
      remoteAccesses: Value(reminder.remoteAccesses),
      accesses: Value(reminder.accesses),
      checksum: Value(reminder.checksum),
      subject: Value(reminder.subject),
      remindAt: Value(reminder.remindAt),
    );
  }
}
