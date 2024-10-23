part of '../task_bloc.dart';

abstract class TaskReminderLinkBlocState extends Equatable {
  const TaskReminderLinkBlocState();

  @override
  List<Object> get props => [];
}

class ReminderLoadingBlocState extends TaskReminderLinkBlocState {}

class ReminderLoadedBlocState extends TaskReminderLinkBlocState {
  final OrganizerItems<ReminderEntity> reminders;

  ReminderLoadedBlocState(this.reminders);

  @override
  List<Object> get props => [reminders];
}

class ReminderAddedToTaskBlocState extends TaskReminderLinkBlocState {}

class ReminderDeletedFromTaskBlocState extends TaskReminderLinkBlocState {}

class ReminderErrorBlocState extends TaskReminderLinkBlocState {
  final String message;

  ReminderErrorBlocState(this.message);

  @override
  List<Object> get props => [message];
}
