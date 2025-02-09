import 'package:fo_fe/features/organizer/all_items/reminder/utils/reminder_exports.dart';
import 'package:fo_fe/features/organizer/all_items/tag/domain/entities/tag.dart';
import 'package:fo_fe/features/organizer/all_items/tag/utils/tag_exports.dart';
import 'package:fo_fe/features/organizer/all_items/user/utils/user_exports.dart';
import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';

class ItemLinkUserBlocState extends OrganizerBlocState<User> {
  final String? errorMessage;

  ItemLinkUserBlocState({
    required super.status,
    super.originalItems,
    super.displayedItems,
    this.errorMessage,
  });

  @override
  List<Object?> get props => [
        status,
        errorMessage,
      ];
}

class ItemLinkTagBlocState extends OrganizerBlocState<TagDto> {
  final String? errorMessage;

  ItemLinkTagBlocState({
    required super.status,
    super.originalItems,
    super.displayedItems,
    this.errorMessage,
  });

  @override
  List<Object?> get props => [
        status,
        errorMessage,
      ];
}

class ItemLinkReminderBlocState extends OrganizerBlocState<Reminder> {
  final String? errorMessage;

  ItemLinkReminderBlocState({
    required super.status,
    super.originalItems,
    super.displayedItems,
    this.errorMessage,
  });

  @override
  List<Object?> get props => [
        status,
        errorMessage,
      ];
}
