import 'package:dartz/dartz.dart';
import 'package:fo_fe/core/utils/exports/core_utils_exports.dart';
import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';

abstract class OrganizerBloc<T extends ItemEntity, P extends ItemParams>
    extends Bloc<OrganizerBlocEvent<ItemEntity>, OrganizerBlocState<ItemEntity>> {
  final Future<Either<Failure, ItemEntity>> Function(P) addItem;
  final Future<Either<Failure, OrganizerItems<ItemEntity>>> Function(P) getItems;
  final Future<Either<Failure, void>> Function(P) deleteItem;

  OrganizerBloc({
    required this.addItem,
    required this.getItems,
    required this.deleteItem,
  }) : super(OrganizerBlocState<T>(status: OrganizerBlocStatus.initial));

  void setupEventHandlers() {
    on<AddItemBlocEvent<T, P>>(_onAddItem);
    on<GetItemsFromLogInUserBlocEvent<T, P>>(_onGetItems);
    on<DeleteItemBlocEvent<T, P>>(_onDeleteItem);
  }

  Future<void> _onAddItem(AddItemBlocEvent<ItemEntity, ItemParams> event,
      Emitter<OrganizerBlocState<ItemEntity>> emit) async {
    emit(state.copyWith(status: OrganizerBlocStatus.loading));
    final result = await addItem(event.item as P);
    result.fold(
      (failure) => emit(state.copyWith(
          status: OrganizerBlocStatus.error, errorMessage: _mapFailureToMessage(failure))),
      (newItem) {
        final updatedOriginalItems = state.originalItems.copyWithAddedItem(newItem);
        final updatedDisplayedItems = state.displayedItems.copyWithAddedItem(newItem);
        emit(state.copyWith(
          status: OrganizerBlocStatus.loaded,
          originalItems: updatedOriginalItems,
          displayedItems: updatedDisplayedItems,
        ));
      },
    );
  }

  Future<void> _onGetItems(GetItemsFromLogInUserBlocEvent<ItemEntity, P> event,
      Emitter<OrganizerBlocState<ItemEntity>> emit) async {
    emit(state.copyWith(status: OrganizerBlocStatus.loading));
    final result = await getItems(event.param);
    result.fold(
      (failure) => emit(state.copyWith(
          status: OrganizerBlocStatus.error, errorMessage: _mapFailureToMessage(failure))),
      (items) => emit(state.copyWith(
          status: OrganizerBlocStatus.loaded, originalItems: items, displayedItems: items)),
    );
  }

  Future<void> _onDeleteItem(DeleteItemBlocEvent<ItemEntity, P> event,
      Emitter<OrganizerBlocState<ItemEntity>> emit) async {
    emit(state.copyWith(status: OrganizerBlocStatus.loading));
    final result = await deleteItem(event.id);
    result.fold(
      (failure) => emit(state.copyWith(
          status: OrganizerBlocStatus.error, errorMessage: _mapFailureToMessage(failure))),
      (_) {
        final updatedOriginalItems = state.originalItems.copyWithRemovedItemWitId(event.id as int);
        final updatedDisplayedItems =
            state.displayedItems.copyWithRemovedItemWitId(event.id as int);
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
