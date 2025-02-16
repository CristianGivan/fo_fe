import 'package:dartz/dartz.dart';
import 'package:fo_fe/core/utils/exports/core_utils_exports.dart';
import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';
import 'package:fo_fe/features/organizer/utils/other/item_type/item_add_params.dart';

abstract class OrganizerBloc<T extends ItemEntity>
    extends Bloc<OrganizerBlocEvent, OrganizerBlocState<T>> {
  final Future<Either<Failure, T>> Function(AddItemParams) addItem;
  final Future<Either<Failure, OrganizerItems<T>>> Function(ItemParams) getItems;
  final Future<Either<Failure, IdSet>> Function(IdSet) deleteItems;

  OrganizerBloc({
    required this.addItem,
    required this.getItems,
    required this.deleteItems,
  }) : super(OrganizerBlocState<T>(status: OrganizerBlocStatus.initial));

  void setupEventHandlers() {
    on<AddItemBlocEvent>(_onAddItem);
    on<GetItemsFromLogInUserBlocEvent>(_onGetItems);
    on<DeleteItemsBlocEvent>(_onDeleteItems);
    on<SearchItemsBlocEvent>(_onSearchItems); // Register the search event
  }

  Future<void> _onSearchItems(
      SearchItemsBlocEvent event, Emitter<OrganizerBlocState<T>> emit) async {
    final query = event.query.toLowerCase();

    if (query.isEmpty) {
      emit(state.copyWith(displayedItems: state.originalItems, searchQuery: ''));
      return;
    }

    final OrganizerItems<T> filteredItems = state.originalItems.filterByQuery(query);
    emit(state.copyWith(displayedItems: filteredItems, searchQuery: query));
  }

  Future<void> _onAddItem(AddItemBlocEvent event, Emitter<OrganizerBlocState<T>> emit) async {
    await handleEvent(
      emit: emit,
      action: () => addItem(event.params),
      originalItems: (newItem) => state.originalItems.copyWithAddedItem(newItem),
      displayedItems: (newItem) => state.displayedItems.copyWithAddedItem(newItem),
    );
    event.params.itemLinkParams?.organizerLinkBloc
        ?.add(GetItemsOfItemBlocEvent(event.params.itemLinkParams!));
  }

  Future<void> _onGetItems(
      GetItemsFromLogInUserBlocEvent event, Emitter<OrganizerBlocState<T>> emit) async {
    await handleEvent(
      emit: emit,
      action: () => getItems(event.params),
      originalItems: (items) => items,
      displayedItems: (items) => items,
    );
  }

  Future<void> _onDeleteItems(
      DeleteItemsBlocEvent event, Emitter<OrganizerBlocState<T>> emit) async {
    await handleEvent(
      emit: emit,
      action: () => deleteItems(event.idSet),
      originalItems: (deletedIds) => state.originalItems.copyWithRemovedItemsWitIds(deletedIds),
      displayedItems: (deletedIds) => state.displayedItems.copyWithRemovedItemsWitIds(deletedIds),
    );
  }

  Future<void> handleEvent<R>({
    required Emitter<OrganizerBlocState<T>> emit,
    required Future<Either<Failure, R>> Function() action,
    OrganizerItems<T>? Function(R result)? originalItems,
    OrganizerItems<T>? Function(R result)? displayedItems,
    void Function(R result)? onSuccess,
  }) async {
    emit(state.copyWith(status: OrganizerBlocStatus.loading));
    final result = await action();
    result.fold(
      (failure) => _onFailure(failure, emit),
      (success) => _onSuccess<R>(
        emit,
        onSuccess,
        success,
        originalItems,
        displayedItems,
      ),
    );
  }

  void _onFailure(Failure failure, Emitter<OrganizerBlocState<T>> emit) {
    emit(state.copyWith(
      status: OrganizerBlocStatus.error,
      errorMessage: _mapFailureToMessage(failure),
    ));
  }

  void _onSuccess<R>(
    Emitter<OrganizerBlocState<T>> emit,
    void Function(R result)? onSuccess,
    R success,
    OrganizerItems<T>? Function(R result)? originalItems,
    OrganizerItems<T>? Function(R result)? displayedItems,
  ) {
    if (onSuccess != null) {
      onSuccess(success);
    } else {
      final updatedOriginalItems = (originalItems ?? (result) => state.originalItems)(success);
      final updatedDisplayedItems = (displayedItems ?? (result) => state.displayedItems)(success);
      emit(state.copyWith(
        status: OrganizerBlocStatus.loaded,
        originalItems: updatedOriginalItems,
        displayedItems: updatedDisplayedItems,
      ));
    }
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case NetworkFailure:
        return 'Network error occurred';
      case ServerFailure:
        return 'Server error occurred';
      case CacheFailure:
        return 'Cache error occurred';
      default:
        return 'Unexpected error occurred';
    }
  }
}
