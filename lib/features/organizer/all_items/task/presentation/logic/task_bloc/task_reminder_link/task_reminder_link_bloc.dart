part of '../task_bloc.dart';

class TaskReminderLinkBloc extends Bloc<TaskReminderLinkBlocEvent, TaskReminderLinkBlocState> {
  final GetReminderItemsByTaskIdUseCase getRemindersByTaskId;
  final UpdateReminderItemsOfTaskUseCase updateReminderItemsOfTask;

  TaskReminderLinkBloc({
    required this.getRemindersByTaskId,
    required this.updateReminderItemsOfTask,
  }) : super(TaskReminderLoadingBlocState()) {
    on<GetReminderItemsByTaskIdBlocEvent>(_onGetRemindersByTaskId);
    on<UpdateReminderItemsOfTaskBlocEvent>(_onUpdateReminderItemsOfTask);
  }

  Future<void> _onGetRemindersByTaskId(
    GetReminderItemsByTaskIdBlocEvent event,
    Emitter<TaskReminderLinkBlocState> emit,
  ) async {
    emit(TaskReminderLoadingBlocState());
    final failureOrReminders = await getRemindersByTaskId(TaskParams(id: event.taskId));
    emit(failureOrReminders.fold(
      (failure) => TaskReminderErrorBlocState(_mapFailureToMessage(failure)),
      (reminders) => TaskReminderLoadedBlocState(reminders),
    ));
  }

  Future<void> _onUpdateReminderItemsOfTask(
    UpdateReminderItemsOfTaskBlocEvent event,
    Emitter<TaskReminderLinkBlocState> emit,
  ) async {
    emit(TaskReminderLoadingBlocState());
    emit(TaskReminderErrorBlocState('Not implemented'));
    // final failureOrOrganizerItems = await updateReminderItemsOfTask(UpdateLinkItemsOfItemParams(
    //   itemId: event.taskId,
    //   items: event.reminderItems,
    //   updatedItems: event.updatedReminderItems,
    // ));
    // emit(failureOrOrganizerItems.fold(
    //   (failure) => TaskReminderErrorBlocState(_mapFailureToMessage(failure)),
    //   (organizerItems) => ReminderItemsUpdatedToTaskBlocState(organizerItems),
    // ));
  }

  String _mapFailureToMessage(Failure failure) {
    if (failure is NetworkFailure) {
      return 'Network error: ${failure.message}';
    } else if (failure is ServerFailure) {
      return 'Server error: ${failure.message}';
    } else {
      return 'An error occurred: \n ${failure.message}';
    }
  }
}
