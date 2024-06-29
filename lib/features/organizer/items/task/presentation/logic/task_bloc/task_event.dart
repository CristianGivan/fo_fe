part of '../../../task_lib.dart';

// abstract class TaskEvent extends Equatable {
//   const TaskEvent();
// }
//
// class GetTaskByIdEvent extends TaskEvent {
//   final String numberString;
//
//   const GetTaskByIdEvent({
//     required this.numberString,
//   });
//
//   @override
//   // TODO: implement props
//   List<Object?> get props => [numberString];
// }
abstract class TaskBlocEvent extends Equatable {
  const TaskBlocEvent();

  @override
  List<Object> get props => [];
}

class LoadTaskItemsAllBlocEvent extends TaskBlocEvent {}

class LoadTaskItemsByIdSetBlocEvent extends TaskBlocEvent {
  final IdSet idSet;

  LoadTaskItemsByIdSetBlocEvent(this.idSet);

  @override
  List<Object> get props => [idSet];
}

class AddTaskBlocEvent extends TaskBlocEvent {
  final TaskEntity task;

  AddTaskBlocEvent(this.task);

  @override
  List<Object> get props => [task];
}

class UpdateTaskBlocEvent extends TaskBlocEvent {
  final TaskEntity task;

  UpdateTaskBlocEvent(this.task);

  @override
  List<Object> get props => [task];
}

class DeleteTaskBlocEvent extends TaskBlocEvent {
  final int taskId;

  DeleteTaskBlocEvent(this.taskId);

  @override
  List<Object> get props => [taskId];
}

class AddUserToTaskBlocEvent extends TaskBlocEvent {
  final int taskId;
  final UserEntity user;

  AddUserToTaskBlocEvent(this.taskId, this.user);

  @override
  List<Object> get props => [taskId, user];
}

class AddTagToTaskBlocEvent extends TaskBlocEvent {
  final int taskId;
  final TagEntity tag;

  AddTagToTaskBlocEvent(this.taskId, this.tag);

  @override
  List<Object> get props => [taskId, tag];
}

class AddReminderToTaskBlocEvent extends TaskBlocEvent {
  final int taskId;
  final ReminderEntity reminder;

  AddReminderToTaskBlocEvent(this.taskId, this.reminder);

  @override
  List<Object> get props => [taskId, reminder];
}
