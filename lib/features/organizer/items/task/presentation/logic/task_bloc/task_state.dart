part of '../../../task_lib.dart';

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

class UserAddedToTaskBlocState extends TaskBlocState {}

class TagAddedToTaskBlocState extends TaskBlocState {}

class ReminderAddedToTaskBlocState extends TaskBlocState {}

class TaskErrorBlocState extends TaskBlocState {
  final String message;

  TaskErrorBlocState(this.message);

  @override
  List<Object> get props => [message];
}

// abstract class TaskBlocState extends Equatable {
//   const TaskBlocState();
//
//   @override
//   List<Object> get props => [];
//
// }
//
// class TaskInitialState extends TaskBlocState {
//   @override
//   List<Object> get props => [];
// }
//
// class TaskLoadingState extends TaskBlocState {
//   @override
//   List<Object> get props => [];
// }
//
// class TaskLoadedState extends TaskBlocState {
//   final TaskEntity taskEntity;
//
//   const TaskLoadedState(this.taskEntity);
//
//   @override
//   List<Object> get props => [taskEntity];
// }
//
// class TaskListLoadedState extends TaskBlocState {
//   final List<TaskEntity> taskEntityList;
//
//   const TaskListLoadedState(this.taskEntityList);
//
//   @override
//   List<Object> get props => [taskEntityList];
// }
//
// class TaskErrorState extends TaskBlocState {
//   final String message;
//
//   const TaskErrorState(this.message);
//
//   @override
//   List<Object> get props => [message];
// }
