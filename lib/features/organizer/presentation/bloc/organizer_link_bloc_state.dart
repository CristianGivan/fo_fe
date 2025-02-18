import 'package:fo_fe/features/organizer/all_items/reminder/utils/reminder_exports.dart';
import 'package:fo_fe/features/organizer/all_items/tag/domain/entities/tagDto.dart';
import 'package:fo_fe/features/organizer/all_items/tag/utils/tag_exports.dart';
import 'package:fo_fe/features/organizer/all_items/user/utils/user_exports.dart';
import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';

class ItemLinkUserBlocState extends OrganizerBlocState<UserDto> {
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

class ItemLinkReminderBlocState extends OrganizerBlocState<ReminderDto> {
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
