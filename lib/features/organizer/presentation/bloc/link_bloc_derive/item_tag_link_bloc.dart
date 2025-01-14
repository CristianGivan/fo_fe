import 'package:dartz/dartz.dart';
import 'package:fo_fe/core/utils/exports/core_utils_exports.dart';
import 'package:fo_fe/features/organizer/all_items/tag/domain/entities/tag.dart';
import 'package:fo_fe/features/organizer/all_items/tag/utils/tag_exports.dart';
import 'package:fo_fe/features/organizer/presentation/bloc/organizer_link_bloc.dart';
import 'package:fo_fe/features/organizer/presentation/bloc/organizer_link_bloc_state.dart';
import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';

class ItemTagLinkBloc extends OrganizerLinkBloc<Tag> {
  ItemTagLinkBloc({
    required Future<Either<Failure, OrganizerItems<Tag>>> Function(ItemsLinkParams params)
        getItemsLinked,
  }) : super(
          getItemsLinked: getItemsLinked,
        ) {
    setupEventHandlers();
  }

  @override
  OrganizerBlocState<Tag> get initialState =>
      ItemLinkTagBlocState(status: OrganizerBlocStatus.initial);

  @override
  void _onSuccess<R>(
    Emitter<OrganizerBlocState<Tag>> emit,
    void Function(R result)? onSuccess,
    R success,
    OrganizerItems<Tag>? Function(R result)? originalItems,
    OrganizerItems<Tag>? Function(R result)? displayedItems,
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
