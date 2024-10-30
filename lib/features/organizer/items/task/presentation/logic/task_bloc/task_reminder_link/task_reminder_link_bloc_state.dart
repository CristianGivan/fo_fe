part of '../task_bloc.dart';

abstract class TaskReminderLinkBlocState extends Equatable {
  const TaskReminderLinkBlocState();

  @override
  List<Object> get props => [];
}

class TaskReminderLoadingBlocState extends TaskReminderLinkBlocState {}

class TaskReminderLoadedBlocState extends TaskReminderLinkBlocState {
  final OrganizerItems<ReminderEntity> reminderItems;

  TaskReminderLoadedBlocState(this.reminderItems);

  @override
  List<Object> get props => [reminderItems];
}

class ReminderItemsUpdeatedToTaskBlocState extends TaskReminderLinkBlocState {
  final OrganizerItems<ReminderEntity> reminderItemsUpdated;

  ReminderItemsUpdeatedToTaskBlocState(this.reminderItemsUpdated);

  @override
  List<Object> get props => [reminderItemsUpdated];
}

class TaskReminderErrorBlocState extends TaskReminderLinkBlocState {
  final String message;

  TaskReminderErrorBlocState(this.message);

  @override
  List<Object> get props => [message];
}
