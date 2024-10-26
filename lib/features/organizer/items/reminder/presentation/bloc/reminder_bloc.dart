import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fo_fe/core/error/failures.dart';
import 'package:fo_fe/core/usecase/no_params.dart';
import 'package:fo_fe/features/organizer/items/reminder/domain/usecases/reminder_usecase_export.dart';
import 'package:fo_fe/features/organizer/items/reminder/utils/reminder_exports.dart';
import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';

part 'reminder_bloc_event.dart';
part 'reminder_bloc_state.dart';

String _mapFailureToMessage(Failure failure) {
  switch (failure.runtimeType) {
    case NetworkFailure:
      return 'Network error occurred';
    case ServerFailure:
      return 'Server error occurred';
    case CacheFailure:
      return 'Cache error occurred';
    case LocalFailure e:
      return e.message.toString();
    default:
      return 'Unexpected error occurred';
  }
}

class ReminderBloc extends Bloc<ReminderBlocEvent, ReminderBlocState> {
  final AddReminder addReminder;
  final UpdateReminder updateReminder;
  final DeleteReminder deleteReminder;
  final GetReminderById getReminderById;
  final GetReminderItemsAll getReminderItemsAll;
  final GetReminderItemsByIdSet getReminderItemsByIdSet;

  ReminderBloc({
    required this.addReminder,
    required this.updateReminder,
    required this.deleteReminder,
    required this.getReminderById,
    required this.getReminderItemsAll,
    required this.getReminderItemsByIdSet,
  }) : super(ReminderInitialBlocState()) {
    on<AddReminderBlocEvent>((event, emit) async {
      emit(ReminderLoadingBlocState());
      final failureOrSuccess =
          await addReminder(ParamsReminder(reminder: event.reminder));
      emit(failureOrSuccess.fold(
        (failure) => ReminderErrorBlocState(_mapFailureToMessage(failure)),
        (id) => ReminderSuccessBlocState(id),
      ));
      add(GetReminderItemsAllBlocEvent());
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
