import 'package:fo_fe/features/organizer/all_items/reminder/domain/entities/reminder_user_entity.dart';
import 'package:fo_fe/features/organizer/all_items/reminder/utils/reminder_exports.dart';
import 'package:fo_fe/features/organizer/domain/entities/dto_entity.dart';

class ReminderDto extends DtoEntity {
  final ReminderEntity reminder;
  final ReminderUserLinkEntity reminderUserLink;

  ReminderDto({
    required this.reminder,
    required this.reminderUserLink,
  }) : super(
          entity: reminder,
          userLink: reminderUserLink,
        );

  ReminderDto copyWith({
    ReminderEntity? reminder,
    ReminderUserLinkEntity? reminderUserLink,
  }) {
    return ReminderDto(
      reminder: reminder ?? this.reminder,
      reminderUserLink: reminderUserLink ?? this.reminderUserLink,
    );
  }

  @override
  // TODO: implement isEmpty
  bool get isEmpty => throw UnimplementedError();

  @override
  List<Object?> get props => [reminder, reminderUserLink];
}
