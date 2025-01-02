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
  }) : super(OrganizerBlocState<T>(status: OrganizerBlocStatus.initial));

  void setupEventHandlers() {
    on<AddItemBlocEvent>(_onAddItem);
    on<GetItemsFromLogInUserBlocEvent>(_onGetItems);
    on<DeleteItemsBlocEvent>(_onDeleteItems);
  }

  Future<void> _onAddItem(
      AddItemBlocEvent event, Emitter<OrganizerBlocState<ItemEntity>> emit) async {
    emit(state.copyWith(status: OrganizerBlocStatus.loading));
    final result = await addItem(event.item);
    result.fold(
      (failure) => emit(state.copyWith(
          status: OrganizerBlocStatus.error, errorMessage: _mapFailureToMessage(failure))),
      (newItem) {
        newItem;
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

  Future<void> _onGetItems(
      GetItemsFromLogInUserBlocEvent event, Emitter<OrganizerBlocState<ItemEntity>> emit) async {
    emit(state.copyWith(status: OrganizerBlocStatus.loading));
    final result = await getItems(event.userId);
    result.fold(
      (failure) => emit(state.copyWith(
          status: OrganizerBlocStatus.error, errorMessage: _mapFailureToMessage(failure))),
      (items) => emit(state.copyWith(
        status: OrganizerBlocStatus.loaded,
        originalItems: items,
        displayedItems: items,
      )),
    );
  }

  Future<void> _onDeleteItems(
      DeleteItemsBlocEvent event, Emitter<OrganizerBlocState<ItemEntity>> emit) async {
    emit(state.copyWith(status: OrganizerBlocStatus.loading));
    final result = await deleteItems(event.idSet);
    result.fold(
      (failure) => emit(state.copyWith(
          status: OrganizerBlocStatus.error, errorMessage: _mapFailureToMessage(failure))),
      (result) {
        final updatedOriginalItems = state.originalItems.copyWithRemovedItemsWitIds(result);
        final updatedDisplayedItems = state.displayedItems.copyWithRemovedItemsWitIds(result);
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
