part of '../task_bloc.dart';

class TaskReminderLinkBloc extends Bloc<TaskReminderLinkBlocEvent, TaskReminderLinkBlocState> {
  final GetRemindersByTaskId getRemindersByTaskId;
  final AddReminderToTask addReminderToTask;
  final DeleteReminderFromTask deleteReminderFromTask;

  TaskReminderLinkBloc({
    required this.getRemindersByTaskId,
    required this.addReminderToTask,
    required this.deleteReminderFromTask,
  }) : super(ReminderLoadingBlocState());

  @override
  Stream<TaskReminderLinkBlocState> mapEventToState(TaskReminderLinkBlocEvent event) async* {
    if (event is GetRemindersByTaskIdBlocEvent) {
      yield ReminderLoadingBlocState();
      final failureOrReminders =
          await getRemindersByTaskId(GetRemindersByTaskIdParams(taskId: event.taskId));
      yield failureOrReminders.fold(
        (failure) => ReminderErrorBlocState(_mapFailureToMessage(failure)),
        (reminders) => ReminderLoadedBlocState(reminders),
      );
    } else if (event is AddReminderToTaskBlocEvent) {
      final failureOrSuccess = await addReminderToTask(
          AddReminderToTaskParams(taskId: event.taskId, reminderId: event.reminder.id));
      yield failureOrSuccess.fold(
        (failure) => ReminderErrorBlocState(_mapFailureToMessage(failure)),
        (_) => ReminderAddedToTaskBlocState(),
      );
    } else if (event is DeleteReminderFromTaskBlocEvent) {
      final failureOrSuccess = await deleteReminderFromTask(
          DeleteReminderFromTaskParams(taskId: event.taskId, reminderId: event.reminderId));
      yield failureOrSuccess.fold(
        (failure) => ReminderErrorBlocState(_mapFailureToMessage(failure)),
        (_) => ReminderDeletedFromTaskBlocState(),
      );
    }
  }
}
