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

class ReminderAddedToTaskBlocState extends TaskReminderLinkBlocState {}

class ReminderItemsAddedToTaskBlocState extends TaskReminderLinkBlocState {
  final OrganizerItems<ReminderEntity> reminderItems;

  ReminderItemsAddedToTaskBlocState(this.reminderItems);

  @override
  List<Object> get props => [reminderItems];
}

class ReminderDeletedFromTaskBlocState extends TaskReminderLinkBlocState {}

class TaskReminderErrorBlocState extends TaskReminderLinkBlocState {
  final String message;

  TaskReminderErrorBlocState(this.message);

  @override
  List<Object> get props => [message];
}
