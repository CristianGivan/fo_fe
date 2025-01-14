import 'package:fo_fe/features/organizer/all_items/reminder/domain/entities/reminder_user_entity.dart';
import 'package:fo_fe/features/organizer/all_items/reminder/utils/reminder_exports.dart';
import 'package:fo_fe/features/organizer/domain/entities/dto_entity.dart';

class Reminder extends DtoEntity {
  final ReminderEntity reminder;
  final ReminderUserLinkEntity reminderUserLink;

  Reminder({
    required this.reminder,
    required this.reminderUserLink,
  }) : super(
          entity: reminder,
          userLink: reminderUserLink,
        );

  Reminder copyWith({
    ReminderEntity? reminder,
    ReminderUserLinkEntity? reminderUserLink,
  }) {
    return Reminder(
      reminder: reminder ?? this.reminder,
      reminderUserLink: reminderUserLink ?? this.reminderUserLink,
    );
  }

  @override
  List<Object?> get props => [reminder, reminderUserLink];
}
