part of '../task_bloc.dart';

class TaskReminderLinkBloc extends Bloc<TaskReminderLinkBlocEvent, TaskReminderLinkBlocState> {
  final GetReminderItemsByTaskId getRemindersByTaskId;
  final AddReminderItemsToTaskUseCase addReminderItemsToTask;
  final UpdateReminderItemsOfTask updateReminderItemsOfTask;
  final DeleteReminderFromTask deleteReminderFromTask;

  TaskReminderLinkBloc({
    required this.getRemindersByTaskId,
    required this.deleteReminderFromTask,
    required this.addReminderItemsToTask,
    required this.updateReminderItemsOfTask,
  }) : super(TaskReminderLoadingBlocState()) {
    on<GetReminderItemsByTaskIdBlocEvent>(_onGetRemindersByTaskId);
    on<DeleteReminderFromTaskBlocEvent>(_onDeleteReminderFromTask);
    on<AddReminderItemsToTaskBlocEvent>(_onAddReminderItemsToTask);
    on<UpdateReminderItemsOfTaskBlocEvent>(_onUpdateReminderItemsOfTask);
  }

  Future<void> _onGetRemindersByTaskId(
    GetReminderItemsByTaskIdBlocEvent event,
    Emitter<TaskReminderLinkBlocState> emit,
  ) async {
    emit(TaskReminderLoadingBlocState());
    final failureOrReminders =
        await getRemindersByTaskId(GetRemindersByTaskIdParams(taskId: event.taskId));
    emit(failureOrReminders.fold(
      (failure) => TaskReminderErrorBlocState(_mapFailureToMessage(failure)),
      (reminders) => TaskReminderLoadedBlocState(reminders),
    ));
  }

  Future<void> _onDeleteReminderFromTask(
    DeleteReminderFromTaskBlocEvent event,
    Emitter<TaskReminderLinkBlocState> emit,
  ) async {
    final failureOrSuccess = await deleteReminderFromTask(
        DeleteReminderFromTaskParams(taskId: event.taskId, reminderId: event.reminderId));
    emit(failureOrSuccess.fold(
      (failure) => TaskReminderErrorBlocState(_mapFailureToMessage(failure)),
      (_) => ReminderDeletedFromTaskBlocState(),
    ));
  }

  Future<void> _onAddReminderItemsToTask(
    AddReminderItemsToTaskBlocEvent event,
    Emitter<TaskReminderLinkBlocState> emit,
  ) async {
    emit(TaskReminderLoadingBlocState());
    final failureOrOrganizerItems = await addReminderItemsToTask(AddItemsToTaskParams(
      taskId: event.taskId,
      itemsIds: event.reminderIds,
    ));
    emit(failureOrOrganizerItems.fold(
      (failure) => TaskReminderErrorBlocState(_mapFailureToMessage(failure)),
      (organizerItems) => ReminderItemsAddedToTaskBlocState(organizerItems),
    ));
  }

  Future<void> _onUpdateReminderItemsOfTask(
    UpdateReminderItemsOfTaskBlocEvent event,
    Emitter<TaskReminderLinkBlocState> emit,
  ) async {
    emit(TaskReminderLoadingBlocState());
    final failureOrOrganizerItems = await updateReminderItemsOfTask(UpdateItemsToTaskParams(
      taskId: event.taskId,
      items: event.reminderItems,
      updatedItems: event.updatedReminderItems,
    ));
    emit(failureOrOrganizerItems.fold(
      (failure) => TaskReminderErrorBlocState(_mapFailureToMessage(failure)),
      (organizerItems) => ReminderItemsAddedToTaskBlocState(organizerItems),
    ));
  }

  String _mapFailureToMessage(Failure failure) {
    if (failure is NetworkFailure) {
      return 'Network error: ${failure.message}';
    } else if (failure is ServerFailure) {
      return 'Server error: ${failure.message}';
    } else {
      return 'An error occurred: ${failure.message}';
    }
  }
}
