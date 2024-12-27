import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';

enum OrganizerBlocStatus { initial, loading, loaded, error }

class OrganizerBlocState<T extends ItemEntity> extends Equatable {
  final OrganizerBlocStatus status;
  final OrganizerItems<T>? originalItems;
  final OrganizerItems<T>? displayedItems;
  final String? errorMessage;

  const OrganizerBlocState({
    required this.status,
    this.originalItems,
    this.displayedItems,
    this.errorMessage,
  });

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
  List<Object?> get props => [status, originalItems, displayedItems, errorMessage];
}
