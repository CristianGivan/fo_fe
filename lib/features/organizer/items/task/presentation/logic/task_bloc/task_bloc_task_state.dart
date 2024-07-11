part of 'task_bloc.dart';

abstract class TaskBlocTaskState extends Equatable {
  const TaskBlocTaskState();

  @override
  List<Object> get props => [];
}

class TaskInitialBlocState extends TaskBlocTaskState {}

class TaskLoadingBlocState extends TaskBlocTaskState {}

class TaskLoadedBlocState extends TaskBlocTaskState {
  final OrganizerItems<TaskEntity> tasks;

  TaskLoadedBlocState(this.tasks);

  @override
  List<Object> get props => [tasks];
}

class TaskAddedBlocState extends TaskBlocTaskState {}

class TaskUpdatedBlocState extends TaskBlocTaskState {}

class TaskDeletedBlocState extends TaskBlocTaskState {}

class TaskErrorBlocState extends TaskBlocTaskState {
  final String message;

  TaskErrorBlocState(this.message);

  @override
  List<Object> get props => [message];
}
