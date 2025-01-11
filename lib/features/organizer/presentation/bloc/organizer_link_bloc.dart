import 'package:dartz/dartz.dart';
import 'package:fo_fe/core/utils/exports/core_utils_exports.dart';
import 'package:fo_fe/features/organizer/presentation/bloc/organizer_link_bloc_event.dart';
import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';

abstract class OrganizerLinkBloc<T extends ItemEntity>
    extends Bloc<OrganizerLinkBlocEvent, OrganizerBlocState<T>> {
  final Future<Either<Failure, OrganizerItems<T>>> Function(ItemParams params) getItemsLinked;

  OrganizerLinkBloc({
    required this.getItemsLinked,
  }) : super(OrganizerBlocState<T>(status: OrganizerBlocStatus.initial));

  void setupEventHandlers() {
    on<GetItemsOfItemBlocEvent>(_onGetItemsLinked);
  }

  Future<void> _onGetItemsLinked(
      GetItemsOfItemBlocEvent event, Emitter<OrganizerBlocState<T>> emit) async {
    await handleEvent(
      event: event,
      emit: emit,
      action: () => getItemsLinked(event.params),
      originalItems: (items) => items,
      displayedItems: (items) => items,
    );
  }

  Future<void> handleEvent<R>({
    required OrganizerLinkBlocEvent event,
    required Emitter<OrganizerBlocState<T>> emit,
    required Future<Either<Failure, R>> Function() action,
    OrganizerItems<T>? Function(R result)? originalItems,
    OrganizerItems<T>? Function(R result)? displayedItems,
    void Function(R result)? onSuccess,
  }) async {
    _onLoading(emit);
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

  void _onLoading(Emitter<OrganizerBlocState<dynamic>> emit) {
    emit(state.copyWith(status: OrganizerBlocStatus.loading));
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
