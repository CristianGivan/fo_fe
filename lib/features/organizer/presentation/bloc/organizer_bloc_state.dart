import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';

enum OrganizerBlocStatus { initial, loading, loaded, error }

class OrganizerBlocState<T extends ItemEntity> extends Equatable {
  final OrganizerBlocStatus status;
  final OrganizerItems<ItemEntity> originalItems;
  final OrganizerItems<ItemEntity> displayedItems;
  final String? errorMessage;

  OrganizerBlocState({
    required this.status,
    OrganizerItems<ItemEntity>? originalItems,
    OrganizerItems<ItemEntity>? displayedItems,
    this.errorMessage,
  })  : originalItems = originalItems ?? OrganizerItems<ItemEntity>.empty(),
        displayedItems = displayedItems ?? OrganizerItems<ItemEntity>.empty();

  OrganizerBlocState<ItemEntity> copyWith({
    OrganizerBlocStatus? status,
    OrganizerItems<ItemEntity>? originalItems,
    OrganizerItems<ItemEntity>? displayedItems,
    String? errorMessage,
  }) {
    return OrganizerBlocState<ItemEntity>(
      status: status ?? this.status,
      originalItems: originalItems ?? this.originalItems,
      displayedItems: displayedItems ?? this.displayedItems,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [
        status,
        originalItems,
        displayedItems,
        errorMessage,
      ];
}
