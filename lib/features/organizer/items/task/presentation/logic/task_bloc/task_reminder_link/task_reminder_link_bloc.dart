part of '../task_bloc.dart';

class TaskReminderLinkBloc
    extends Bloc<TaskReminderLinkBlocEvent, TaskReminderLinkBlocState> {
  final GetReminderItemsByTaskId getRemindersByTaskId;
  final AddReminderToTask addReminderToTask;
  final AddItemsToTaskUseCase<ReminderEntity> addItemsToTask;
  final UpdateReminderItemsOfTask updateReminderItemsOfTask;
  final DeleteReminderFromTask deleteReminderFromTask;

  TaskReminderLinkBloc({
    required this.getRemindersByTaskId,
    required this.addReminderToTask,
    required this.deleteReminderFromTask,
    required this.addItemsToTask,
    required this.updateReminderItemsOfTask,
  }) : super(TaskReminderLoadingBlocState()) {
    on<GetReminderItemsByTaskIdBlocEvent>(_onGetRemindersByTaskId);
    on<AddReminderToTaskBlocEvent>(_onAddReminderToTask);
    on<DeleteReminderFromTaskBlocEvent>(_onDeleteReminderFromTask);
    on<AddReminderItemsToTaskBlocEvent>(_onAddReminderItemsToTask);
    on<UpdateReminderItemsOfTaskBlocEvent>(_onUpdateReminderItemsOfTask);
  }

  Future<void> _onGetRemindersByTaskId(
    GetReminderItemsByTaskIdBlocEvent event,
    Emitter<TaskReminderLinkBlocState> emit,
  ) async {
    emit(TaskReminderLoadingBlocState());
    final failureOrReminders = await getRemindersByTaskId(
        GetRemindersByTaskIdParams(taskId: event.taskId));
    emit(failureOrReminders.fold(
      (failure) => TaskReminderErrorBlocState(_mapFailureToMessage(failure)),
      (reminders) => TaskReminderLoadedBlocState(reminders),
    ));
  }

  Future<void> _onAddReminderToTask(
    AddReminderToTaskBlocEvent event,
    Emitter<TaskReminderLinkBlocState> emit,
  ) async {
    final failureOrSuccess = await addReminderToTask(AddReminderToTaskParams(
        taskId: event.taskId, reminderId: event.reminder.id));
    emit(failureOrSuccess.fold(
      (failure) => TaskReminderErrorBlocState(_mapFailureToMessage(failure)),
      (_) => ReminderAddedToTaskBlocState(),
    ));
  }

  Future<void> _onDeleteReminderFromTask(
    DeleteReminderFromTaskBlocEvent event,
    Emitter<TaskReminderLinkBlocState> emit,
  ) async {
    final failureOrSuccess = await deleteReminderFromTask(
        DeleteReminderFromTaskParams(
            taskId: event.taskId, reminderId: event.reminderId));
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
    final failureOrOrganizerItems = await addItemsToTask(AddItemsToTaskParams(
      taskId: event.taskId,
      itemsIds: event.reminderIds,
      itemType: ItemsType.reminder,
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
    final failureOrOrganizerItems = await updateReminderItemsOfTask(
        UpdateReminderItemsToTaskParams(
            taskId: event.taskId,
            reminderItems: event.reminderItems,
            updatedReminderItems: event.updatedReminderItems));
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
