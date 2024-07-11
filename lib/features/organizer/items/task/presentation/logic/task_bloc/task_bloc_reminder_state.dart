part of 'task_bloc.dart';

abstract class TaskBlocReminderState extends Equatable {
  const TaskBlocReminderState();

  @override
  List<Object> get props => [];
}

class ReminderLoadingBlocState extends TaskBlocReminderState {}

class ReminderLoadedBlocState extends TaskBlocReminderState {
  final List<ReminderEntity> reminders;

  ReminderLoadedBlocState(this.reminders);

  @override
  List<Object> get props => [reminders];
}

class ReminderAddedToTaskBlocState extends TaskBlocReminderState {}

class ReminderDeletedFromTaskBlocState extends TaskBlocReminderState {}

class ReminderErrorBlocState extends TaskBlocReminderState {
  final String message;

  ReminderErrorBlocState(this.message);

  @override
  List<Object> get props => [message];
}
