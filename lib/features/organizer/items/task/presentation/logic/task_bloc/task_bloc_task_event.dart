part of 'task_bloc.dart';

abstract class TaskBlocTaskEvent extends Equatable {
  const TaskBlocTaskEvent();

  @override
  List<Object> get props => [];
}

class GetTaskByIdBlocEvent extends TaskBlocTaskEvent {
  final int taskId;

  GetTaskByIdBlocEvent(this.taskId);

  @override
  List<Object> get props => [taskId];
}

class GetTaskItemsAllBlocEvent extends TaskBlocTaskEvent {}

class LoadTaskItemsByIdSetBlocEvent extends TaskBlocTaskEvent {
  final IdSet idSet;

  LoadTaskItemsByIdSetBlocEvent(this.idSet);

  @override
  List<Object> get props => [idSet];
}

class AddTaskBlocEvent extends TaskBlocTaskEvent {
  final TaskEntity task;

  AddTaskBlocEvent(this.task);

  @override
  List<Object> get props => [task];
}

class UpdateTaskBlocEvent extends TaskBlocTaskEvent {
  final TaskEntity task;

  UpdateTaskBlocEvent(this.task);

  @override
  List<Object> get props => [task];
}

class DeleteTaskBlocEvent extends TaskBlocTaskEvent {
  final int taskId;

  DeleteTaskBlocEvent(this.taskId);

  @override
  List<Object> get props => [taskId];
}
