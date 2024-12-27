import 'package:dartz/dartz.dart';
import 'package:fo_fe/core/utils/exports/core_utils_exports.dart';
import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';

abstract class OrganizerBloc<T extends ItemEntity, P>
    extends Bloc<OrganizerBlocEvent<T>, OrganizerBlocState<T>> {
  final Future<Either<Failure, OrganizerItems<T>>> Function(P) fetchItems;
  final Future<Either<Failure, T>> Function(P) addItem;
  final Future<Either<Failure, T>> Function(P) updateItem;
  final Future<Either<Failure, void>> Function(P) deleteItem;

  OrganizerBloc({
    required this.fetchItems,
    required this.addItem,
    required this.updateItem,
    required this.deleteItem,
  }) : super(OrganizerBlocState<T>(status: OrganizerBlocStatus.initial));

  void setupEventHandlers() {
    on<GetItemsFromLogInUserBlocEvent<T, P>>(_onFetchItems);
    on<AddItemBlocEvent<T, P>>(_onAddItem);
    on<UpdateItemBlocEvent<T, P>>(_onUpdateItem);
    on<DeleteItemBlocEvent<T, P>>(_onDeleteItem);
  }

  Future<void> _onFetchItems(
      GetItemsFromLogInUserBlocEvent<T, P> event, Emitter<OrganizerBlocState<T>> emit) async {
    emit(state.copyWith(status: OrganizerBlocStatus.loading));
    final result = await fetchItems(event.param);
    result.fold(
      (failure) => emit(state.copyWith(
          status: OrganizerBlocStatus.error, errorMessage: _mapFailureToMessage(failure))),
      (items) => emit(state.copyWith(
          status: OrganizerBlocStatus.loaded, originalItems: items, displayedItems: items)),
    );
  }

  Future<void> _onAddItem(AddItemBlocEvent<T, P> event, Emitter<OrganizerBlocState<T>> emit) async {
    emit(state.copyWith(status: OrganizerBlocStatus.loading));
    final result = await addItem(event.item);
    result.fold(
      (failure) => emit(state.copyWith(
          status: OrganizerBlocStatus.error, errorMessage: _mapFailureToMessage(failure))),
      (newItem) {
        final updatedOriginalItems = state.originalItems?.copyWithAddedItem(newItem);
        final updatedDisplayedItems = state.displayedItems?.copyWithAddedItem(newItem);
        emit(state.copyWith(
          status: OrganizerBlocStatus.loaded,
          originalItems: updatedOriginalItems,
          displayedItems: updatedDisplayedItems,
        ));
      },
    );
  }

  Future<void> _onUpdateItem(
      UpdateItemBlocEvent<T, P> event, Emitter<OrganizerBlocState<T>> emit) async {
    emit(state.copyWith(status: OrganizerBlocStatus.loading));
    final result = await updateItem(event.item);
    result.fold(
      (failure) => emit(state.copyWith(
          status: OrganizerBlocStatus.error, errorMessage: _mapFailureToMessage(failure))),
      (updatedItem) {
        final updatedOriginalItems = state.originalItems?.copyWithUpdatedItem(updatedItem);
        final updatedDisplayedItems = state.displayedItems?.copyWithUpdatedItem(updatedItem);
        emit(state.copyWith(
          status: OrganizerBlocStatus.loaded,
          originalItems: updatedOriginalItems,
          displayedItems: updatedDisplayedItems,
        ));
      },
    );
  }

  Future<void> _onDeleteItem(
      DeleteItemBlocEvent<T, P> event, Emitter<OrganizerBlocState<T>> emit) async {
    emit(state.copyWith(status: OrganizerBlocStatus.loading));
    final result = await deleteItem(event.id);
    result.fold(
      (failure) => emit(state.copyWith(
          status: OrganizerBlocStatus.error, errorMessage: _mapFailureToMessage(failure))),
      (_) {
        final updatedOriginalItems = state.originalItems?.copyWithRemovedItemWitId(event.id as int);
        final updatedDisplayedItems =
            state.displayedItems?.copyWithRemovedItemWitId(event.id as int);
        emit(state.copyWith(
          status: OrganizerBlocStatus.loaded,
          originalItems: updatedOriginalItems,
          displayedItems: updatedDisplayedItems,
        ));
      },
    );
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
        return 'An error occurred: ${failure.message}';
    }
  }
}
