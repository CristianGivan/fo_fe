part of 'task_bloc.dart';

abstract class TaskBlocState extends Equatable {
  const TaskBlocState();

  @override
  List<Object> get props => [];
}

class TaskInitialBlocState extends TaskBlocState {}

class TaskLoadingBlocState extends TaskBlocState {}

class TaskLoadedBlocState extends TaskBlocState {
  final OrganizerItems<TaskEntity> tasks;

  TaskLoadedBlocState(this.tasks);

  @override
  List<Object> get props => [tasks];
}

class TaskAddedBlocState extends TaskBlocState {}

class TaskUpdatedBlocState extends TaskBlocState {}

class TaskDeletedBlocState extends TaskBlocState {}

class TaskErrorBlocState extends TaskBlocState {
  final String message;

  TaskErrorBlocState({this.message = "default error message"});

  @override
  List<Object> get props => [message];
}
