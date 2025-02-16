import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';

enum OrganizerBlocStatus { initial, loading, loaded, error }

class OrganizerBlocState<T extends ItemEntity> extends Equatable {
  final OrganizerBlocStatus status;
  final OrganizerItems<T> originalItems;
  final OrganizerItems<T> displayedItems;
  final String searchQuery;
  final String? errorMessage;

  OrganizerBlocState({
    required this.status,
    OrganizerItems<T>? originalItems,
    OrganizerItems<T>? displayedItems,
    this.searchQuery = '',
    this.errorMessage,
  })  : originalItems = originalItems ?? OrganizerItems<T>.empty(),
        displayedItems = displayedItems ?? OrganizerItems<T>.empty();

  OrganizerBlocState<T> copyWith({
    OrganizerBlocStatus? status,
    OrganizerItems<T>? originalItems,
    OrganizerItems<T>? displayedItems,
    String? searchQuery,
    String? errorMessage,
  }) {
    return OrganizerBlocState<T>(
      status: status ?? this.status,
      originalItems: originalItems ?? this.originalItems,
      displayedItems: displayedItems ?? this.displayedItems,
      searchQuery: searchQuery ?? this.searchQuery,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [
        status,
        originalItems,
        displayedItems,
        searchQuery,
        errorMessage,
      ];
}
