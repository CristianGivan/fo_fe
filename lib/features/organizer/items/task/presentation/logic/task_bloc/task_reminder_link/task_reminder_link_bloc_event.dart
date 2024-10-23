part of '../task_bloc.dart';

abstract class TaskReminderLinkBlocEvent extends Equatable {
  const TaskReminderLinkBlocEvent();

  @override
  List<Object> get props => [];
}

class GetRemindersByTaskIdBlocEvent extends TaskReminderLinkBlocEvent {
  final int taskId;

  GetRemindersByTaskIdBlocEvent(this.taskId);

  @override
  List<Object> get props => [taskId];
}

class AddReminderToTaskBlocEvent extends TaskReminderLinkBlocEvent {
  final int taskId;
  final ReminderEntity reminder;

  AddReminderToTaskBlocEvent(this.taskId, this.reminder);

  @override
  List<Object> get props => [taskId, reminder];
}

class DeleteReminderFromTaskBlocEvent extends TaskReminderLinkBlocEvent {
  final int taskId;
  final int reminderId;

  DeleteReminderFromTaskBlocEvent(this.taskId, this.reminderId);

  @override
  List<Object> get props => [taskId, reminderId];
}
