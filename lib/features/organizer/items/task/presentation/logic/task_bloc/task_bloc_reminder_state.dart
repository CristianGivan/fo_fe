part of 'task_bloc.dart';

abstract class TaskReminderBlocState extends Equatable {
  const TaskReminderBlocState();

  @override
  List<Object> get props => [];
}

class ReminderLoadingBlocState extends TaskReminderBlocState {}

class ReminderLoadedBlocState extends TaskReminderBlocState {
  final List<ReminderEntity> reminders;

  ReminderLoadedBlocState(this.reminders);

  @override
  List<Object> get props => [reminders];
}

class ReminderAddedToTaskBlocState extends TaskReminderBlocState {}

class ReminderDeletedFromTaskBlocState extends TaskReminderBlocState {}

class ReminderErrorBlocState extends TaskReminderBlocState {
  final String message;

  ReminderErrorBlocState(this.message);

  @override
  List<Object> get props => [message];
}
