import 'package:dartz/dartz.dart';
import 'package:fo_fe/core/utils/exports/core_utils_exports.dart';
import 'package:fo_fe/features/organizer/all_items/reminder/utils/reminder_exports.dart';
import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';

class ItemReminderLinkBloc extends OrganizerLinkBloc<Reminder> {
  ItemReminderLinkBloc({
    required Future<Either<Failure, OrganizerItems<Reminder>>> Function(ItemsLinkParams params)
        getItemsLinked,
  }) : super(
          getItemsLinked: getItemsLinked,
        ) {
    setupEventHandlers();
  }

  @override
  OrganizerBlocState<Reminder> get initialState =>
      ItemLinkReminderBlocState(status: OrganizerBlocStatus.initial);

  @override
  void _onSuccess<R>(
    Emitter<OrganizerBlocState<Reminder>> emit,
    void Function(R result)? onSuccess,
    R success,
    OrganizerItems<Reminder>? Function(R result)? originalItems,
    OrganizerItems<Reminder>? Function(R result)? displayedItems,
  ) {
    final updatedOriginalItems = (originalItems ?? (result) => state.originalItems)(success);
    final updatedDisplayedItems = (displayedItems ?? (result) => state.displayedItems)(success);

    emit(ItemLinkReminderBlocState(
      status: OrganizerBlocStatus.loaded,
      originalItems: updatedOriginalItems,
      displayedItems: updatedDisplayedItems,
    ));
  }
}
