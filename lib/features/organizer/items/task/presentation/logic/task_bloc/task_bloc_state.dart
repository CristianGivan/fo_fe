part of 'task_bloc.dart';

abstract class TaskBlocState extends Equatable {
  const TaskBlocState();

  @override
  List<Object> get props => [];
}

class TaskInitialBlocState extends TaskBlocState {}

class TaskLoadingBlocState extends TaskBlocState {}

class TaskLoadedBlocState extends TaskBlocState {
  final OrganizerItems<TaskEntity> originalTasks;
  final OrganizerItems<TaskEntity> displayedTasks;

  TaskLoadedBlocState({
    required this.originalTasks,
    required this.displayedTasks,
  });

  @override
  List<Object> get props => [originalTasks, displayedTasks];
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
