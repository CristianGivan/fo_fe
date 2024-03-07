part of '../../../task_lib.dart';

abstract class TaskBlocState extends Equatable {
  const TaskBlocState();
}

class TaskInitialState extends TaskBlocState {
  @override
  List<Object> get props => [];
}

class TaskLoadingState extends TaskBlocState {
  @override
  List<Object> get props => [];
}

class TaskLoadedState extends TaskBlocState {
  final TaskEntity taskEntity;

  const TaskLoadedState(this.taskEntity);

  @override
  List<Object> get props => [taskEntity];
}

class TaskListLoadedState extends TaskBlocState {
  final List<TaskEntity> taskEntityList;

  const TaskListLoadedState(this.taskEntityList);

  @override
  List<Object> get props => [taskEntityList];
}

class TaskErrorState extends TaskBlocState {
  final String message;

  const TaskErrorState(this.message);

  @override
  List<Object> get props => [message];
}
