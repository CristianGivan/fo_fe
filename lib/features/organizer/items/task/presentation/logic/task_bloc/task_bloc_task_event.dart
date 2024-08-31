part of 'task_bloc.dart';

abstract class TaskBlocTaskEvent extends Equatable {
  const TaskBlocTaskEvent();

  @override
  List<Object> get props => [];
}

class TaskGetByIdBlocEvent extends TaskBlocTaskEvent {
  final int taskId;

  TaskGetByIdBlocEvent(this.taskId);

  @override
  List<Object> get props => [taskId];
}

class TaskGetItemsAllBlocEvent extends TaskBlocTaskEvent {}

class TaskLoadItemsByIdSetBlocEvent extends TaskBlocTaskEvent {
  final IdSet idSet;

  TaskLoadItemsByIdSetBlocEvent(this.idSet);

  @override
  List<Object> get props => [idSet];
}

class TaskAddBlocEvent extends TaskBlocTaskEvent {
  final TaskEntity task;

  TaskAddBlocEvent(this.task);

  @override
  List<Object> get props => [task];
}

class TaskUpdateBlocEvent extends TaskBlocTaskEvent {
  final TaskEntity task;

  TaskUpdateBlocEvent(this.task);

  @override
  List<Object> get props => [task];
}

class TaskDeleteBlocEvent extends TaskBlocTaskEvent {
  final int taskId;

  TaskDeleteBlocEvent(this.taskId);

  @override
  List<Object> get props => [taskId];
}
