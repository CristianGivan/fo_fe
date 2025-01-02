import 'package:dartz/dartz.dart';
import 'package:fo_fe/core/utils/exports/core_utils_exports.dart';
import 'package:fo_fe/features/organizer/domain/entities/dto_entity.dart';
import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';

abstract class OrganizerBloc<T extends DtoEntity>
    extends Bloc<OrganizerBlocEvent, OrganizerBlocState<T>> {
  final Future<Either<Failure, T>> Function(ItemEntity) addItem;
  final Future<Either<Failure, OrganizerItems<T>>> Function(int) getItems;
  final Future<Either<Failure, IdSet>> Function(IdSet) deleteItems;

  OrganizerBloc({
    required this.addItem,
    required this.getItems,
    required this.deleteItems,
  }) : super(OrganizerBlocState<T>(status: OrganizerBlocStatus.initial)) {
    setupEventHandlers();
  }

  void setupEventHandlers() {
    on<AddItemBlocEvent>(_onAddItem);
    on<GetItemsFromLogInUserBlocEvent>(_onGetItems);
    on<DeleteItemsBlocEvent>(_onDeleteItems);
  }

  Future<void> _onAddItem(AddItemBlocEvent event, Emitter<OrganizerBlocState<T>> emit) async {
    await _handleEvent(
      emit,
      () => addItem(event.item),
      (newItem) => state.originalItems.copyWithAddedItem(newItem),
      (newItem) => state.displayedItems.copyWithAddedItem(newItem),
    );
  }

  Future<void> _onGetItems(
      GetItemsFromLogInUserBlocEvent event, Emitter<OrganizerBlocState<T>> emit) async {
    await _handleEvent(
      emit,
      () => getItems(event.userId),
      (items) => items,
      (items) => items,
    );
  }

  Future<void> _onDeleteItems(
      DeleteItemsBlocEvent event, Emitter<OrganizerBlocState<T>> emit) async {
    await _handleEvent(
      emit,
      () => deleteItems(event.idSet),
      (deletedIds) => state.originalItems.copyWithRemovedItemsWitIds(deletedIds),
      (deletedIds) => state.displayedItems.copyWithRemovedItemsWitIds(deletedIds),
    );
  }

  Future<void> _handleEvent<R>(
    Emitter<OrganizerBlocState<T>> emit,
    Future<Either<Failure, R>> Function() action,
    OrganizerItems<T> Function(R result) onUpdatedOriginalItems,
    OrganizerItems<T> Function(R result) onUpdatedDisplayedItems,
  ) async {
    emit(state.copyWith(status: OrganizerBlocStatus.loading));
    final result = await action();
    result.fold(
      (failure) => emit(state.copyWith(
        status: OrganizerBlocStatus.error,
        errorMessage: _mapFailureToMessage(failure),
      )),
      (success) {
        final updatedOriginalItems = onUpdatedOriginalItems(success);
        final updatedDisplayedItems = onUpdatedDisplayedItems(success);
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
