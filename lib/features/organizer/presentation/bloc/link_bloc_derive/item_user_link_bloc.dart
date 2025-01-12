import 'package:dartz/dartz.dart';
import 'package:fo_fe/core/utils/exports/core_utils_exports.dart';
import 'package:fo_fe/features/organizer/all_items/user/utils/user_exports.dart';
import 'package:fo_fe/features/organizer/presentation/bloc/organizer_link_bloc.dart';
import 'package:fo_fe/features/organizer/presentation/bloc/organizer_link_bloc_state.dart';
import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';

class ItemUserLinkBloc extends OrganizerLinkBloc<UserEntity> {
  ItemUserLinkBloc({
    required Future<Either<Failure, OrganizerItems<UserEntity>>> Function(ItemsLinkParams params)
        getItemsLinked,
  }) : super(
          getItemsLinked: getItemsLinked,
        ) {
    setupEventHandlers();
  }

  @override
  OrganizerBlocState<UserEntity> get initialState =>
      ItemLinkUserBlocState(status: OrganizerBlocStatus.initial);

  @override
  void _onSuccess<R>(
    Emitter<OrganizerBlocState<UserEntity>> emit,
    void Function(R result)? onSuccess,
    R success,
    OrganizerItems<UserEntity>? Function(R result)? originalItems,
    OrganizerItems<UserEntity>? Function(R result)? displayedItems,
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
