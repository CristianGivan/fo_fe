part of 'tasks_bloc.dart';

sealed class TasksEvent extends Equatable {
  const TasksEvent();

  @override
  List<Object?> get props => [];
}

class TasksInitialized extends TasksEvent {}

class TasksAdded extends TasksEvent {
  final Tasks tasks;

  const TasksAdded(this.tasks);

  @override
  List<Object?> get props => [tasks];
}

class RemoveTasks extends TasksEvent {
  final Tasks tasks;

  const RemoveTasks(this.tasks);

  @override
  List<Object?> get props => [tasks];
}

class UpdateTasks extends TasksEvent {
  final int index;

  const UpdateTasks(this.index);

  @override
  List<Object?> get props => [index];
}