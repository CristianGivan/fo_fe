part of 'task_bloc.dart';

abstract class TaskBlocReminderEvent extends Equatable {
  const TaskBlocReminderEvent();

  @override
  List<Object> get props => [];
}

class GetRemindersByTaskIdBlocEvent extends TaskBlocReminderEvent {
  final int taskId;

  GetRemindersByTaskIdBlocEvent(this.taskId);

  @override
  List<Object> get props => [taskId];
}

class AddReminderToTaskBlocEvent extends TaskBlocReminderEvent {
  final int taskId;
  final ReminderEntity reminder;

  AddReminderToTaskBlocEvent(this.taskId, this.reminder);

  @override
  List<Object> get props => [taskId, reminder];
}

class DeleteReminderFromTaskBlocEvent extends TaskBlocReminderEvent {
  final int taskId;
  final int reminderId;

  DeleteReminderFromTaskBlocEvent(this.taskId, this.reminderId);

  @override
  List<Object> get props => [taskId, reminderId];
}
