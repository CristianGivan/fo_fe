import 'package:dartz/dartz.dart';
import 'package:fo_fe/core/utils/exports/core_utils_exports.dart';
import 'package:fo_fe/features/organizer/all_items/user/utils/user_exports.dart';
import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';

class ItemUserLinkBloc extends OrganizerLinkBloc<User> {
  ItemUserLinkBloc({
    required Future<Either<Failure, OrganizerItems<User>>> Function(ItemsLinkParams params)
        getItemsLinked,
  }) : super(
          getItemsLinked: getItemsLinked,
        ) {
    setupEventHandlers();
  }

  @override
  OrganizerBlocState<User> get initialState =>
      ItemLinkUserBlocState(status: OrganizerBlocStatus.initial);

  @override
  void _onSuccess<R>(
    Emitter<OrganizerBlocState<User>> emit,
    void Function(R result)? onSuccess,
    R success,
    OrganizerItems<User>? Function(R result)? originalItems,
    OrganizerItems<User>? Function(R result)? displayedItems,
  ) {
    final updatedOriginalItems = (originalItems ?? (result) => state.originalItems)(success);
    final updatedDisplayedItems = (displayedItems ?? (result) => state.displayedItems)(success);

    emit(ItemLinkUserBlocState(
      status: OrganizerBlocStatus.loaded,
      originalItems: updatedOriginalItems,
      displayedItems: updatedDisplayedItems,
    ));
  }
}
