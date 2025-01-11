import 'package:dartz/dartz.dart';
import 'package:fo_fe/core/utils/exports/core_utils_exports.dart';
import 'package:fo_fe/features/organizer/all_items/tag/utils/tag_exports.dart';
import 'package:fo_fe/features/organizer/presentation/bloc/organizer_link_bloc.dart';
import 'package:fo_fe/features/organizer/presentation/bloc/organizer_link_bloc_state.dart';
import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';

class ItemLinkTagBloc extends OrganizerLinkBloc<TagEntity> {
  ItemLinkTagBloc({
    required Future<Either<Failure, OrganizerItems<TagEntity>>> Function(ItemParams params)
        getItemsLinked,
  }) : super(
          getItemsLinked: getItemsLinked,
        ) {
    setupEventHandlers();
  }

  @override
  OrganizerBlocState<TagEntity> get initialState =>
      ItemLinkTagBlocState(status: OrganizerBlocStatus.initial);

  @override
  void _onSuccess<R>(
    Emitter<OrganizerBlocState<TagEntity>> emit,
    void Function(R result)? onSuccess,
    R success,
    OrganizerItems<TagEntity>? Function(R result)? originalItems,
    OrganizerItems<TagEntity>? Function(R result)? displayedItems,
  ) {
    final updatedOriginalItems = (originalItems ?? (result) => state.originalItems)(success);
    final updatedDisplayedItems = (displayedItems ?? (result) => state.displayedItems)(success);

    emit(ItemLinkTagBlocState(
      status: OrganizerBlocStatus.loaded,
      originalItems: updatedOriginalItems,
      displayedItems: updatedDisplayedItems,
    ));
  }
}
