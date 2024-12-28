import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';

enum OrganizerBlocStatus { initial, loading, loaded, error }

class OrganizerBlocState<T extends ItemEntity> extends Equatable {
  final OrganizerBlocStatus status;
  final OrganizerItems<T> originalItems;
  final OrganizerItems<T> displayedItems;
  final String? errorMessage;

  OrganizerBlocState({
    required this.status,
    OrganizerItems<T>? originalItems,
    OrganizerItems<T>? displayedItems,
    this.errorMessage,
  })  : originalItems = originalItems ?? OrganizerItems<T>.empty(),
        displayedItems = displayedItems ?? OrganizerItems<T>.empty();

  OrganizerBlocState<T> copyWith({
    OrganizerBlocStatus? status,
    OrganizerItems<T>? originalItems,
    OrganizerItems<T>? displayedItems,
    String? errorMessage,
  }) {
    return OrganizerBlocState<T>(
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
