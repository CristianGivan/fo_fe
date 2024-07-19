part of 'reminder_bloc.dart';

class ReminderBlocReminder extends Bloc<ReminderBlocEvent, ReminderBlocState> {
  final InsertReminder insertReminder;
  final UpdateReminder updateReminder;
  final DeleteReminder deleteReminder;
  final GetReminderById getReminderById;
  final GetReminderItemsAll getReminderItemsAll;
  final GetReminderItemsByIdSet getReminderItemsByIdSet;

  ReminderBlocReminder({
    required this.insertReminder,
    required this.updateReminder,
    required this.deleteReminder,
    required this.getReminderById,
    required this.getReminderItemsAll,
    required this.getReminderItemsByIdSet,
  }) : super(ReminderInitialBlocState()) {
    on<InsertReminderBlocEvent>((event, emit) async {
      emit(ReminderLoadingBlocState());
      final failureOrSuccess =
          await insertReminder(ParamsReminder(reminder: event.reminder));
      emit(failureOrSuccess.fold(
        (failure) => ReminderErrorBlocState(_mapFailureToMessage(failure)),
        (id) => ReminderLoadedBlocState(event.reminder.copyWith(id: id)),
      ));
    });

    on<UpdateReminderBlocEvent>((event, emit) async {
      emit(ReminderLoadingBlocState());
      final failureOrSuccess =
          await updateReminder(ParamsReminder(reminder: event.reminder));
      emit(failureOrSuccess.fold(
        (failure) => ReminderErrorBlocState(_mapFailureToMessage(failure)),
        (success) => success
            ? ReminderLoadedBlocState(event.reminder)
            : ReminderErrorBlocState('Failed to update reminder'),
      ));
    });

    on<DeleteReminderBlocEvent>((event, emit) async {
      emit(ReminderLoadingBlocState());
      final failureOrSuccess =
          await deleteReminder(DeleteTagParams(id: event.id));
      emit(failureOrSuccess.fold(
        (failure) => ReminderErrorBlocState(_mapFailureToMessage(failure)),
        (id) => ReminderInitialBlocState(),
      ));
    });

    on<GetReminderByIdBlocEvent>((event, emit) async {
      emit(ReminderLoadingBlocState());
      final failureOrReminder =
          await getReminderById(GetTagByIdParams(id: event.id));
      emit(failureOrReminder.fold(
        (failure) => ReminderErrorBlocState(_mapFailureToMessage(failure)),
        (reminder) => ReminderLoadedBlocState(reminder!),
      ));
    });

    on<GetReminderItemsAllBlocEvent>((event, emit) async {
      emit(ReminderLoadingBlocState());
      final failureOrReminders = await getReminderItemsAll(NoParams());
      emit(failureOrReminders.fold(
        (failure) => ReminderErrorBlocState(_mapFailureToMessage(failure)),
        (reminders) => ReminderItemsLoadedBlocState(reminders),
      ));
    });

    on<GetReminderItemsByIdSetBlocEvent>((event, emit) async {
      emit(ReminderLoadingBlocState());
      final failureOrReminders =
          await getReminderItemsByIdSet(ParamsIdSet(idSet: event.idSet));
      emit(failureOrReminders.fold(
        (failure) => ReminderErrorBlocState(_mapFailureToMessage(failure)),
        (reminders) => ReminderItemsLoadedBlocState(reminders),
      ));
    });
  }
}
