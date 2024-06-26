class ReminderEntity {
  final int id;
  final DateTime? reminderDate;
  final int organizerItemId;

  ReminderEntity({
    required this.id,
    this.reminderDate,
    required this.organizerItemId,
  });
}
