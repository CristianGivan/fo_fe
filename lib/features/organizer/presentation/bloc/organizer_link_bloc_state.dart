import 'package:fo_fe/features/organizer/all_items/tag/utils/tag_exports.dart';
import 'package:fo_fe/features/organizer/all_items/user/utils/user_exports.dart';
import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';

class ItemLinkUserBlocState extends OrganizerBlocState<UserEntity> {
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

class ItemLinkTagBlocState extends OrganizerBlocState<TagEntity> {
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
