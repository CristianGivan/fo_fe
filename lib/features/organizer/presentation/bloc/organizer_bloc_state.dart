import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';

enum OrganizerBlocStatus { initial, loading, loaded, error }

Widget buildStateWidget({
  required OrganizerBlocState state,
  required Widget Function(String?) buildErrorState,
  required Widget Function() buildLoadingState,
  required Widget Function() buildLoadedState,
}) {
  switch (state.status) {
    case OrganizerBlocStatus.error:
      return buildErrorState(state.errorMessage);
    case OrganizerBlocStatus.initial:
    case OrganizerBlocStatus.loading:
      return buildLoadingState();
    case OrganizerBlocStatus.loaded:
      return buildLoadedState();
    default:
      return Center(child: Text("State undefined"));
  }
}

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
