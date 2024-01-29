part of '../../../task.dart';

sealed class TaskEvent extends Equatable {
  const TaskEvent();

  @override
  List<Object?> get props => [];
}

// todo get last task viewed before closed
class TaskInitialized extends TaskEvent {}

class GetAllTask extends TaskEvent {}
// todo get all task
// class GetAllTask extends TaskEvent {}

class GetTaskListByTasksId extends TaskEvent {
  final int tasksId;

  const GetTaskListByTasksId(
    this.tasksId,
  );

  @override
  List<Object?> get props => [tasksId];
}

class TaskAdded extends TaskEvent {
  final Task task;

  const TaskAdded(this.task);

  @override
  List<Object?> get props => [task];
}

class RemoveTask extends TaskEvent {
  final Task task;

  const RemoveTask(this.task);

  @override
  List<Object?> get props => [task];
}

class UpdateTask extends TaskEvent {
  final int index;

  const UpdateTask(this.index);

  @override
  List<Object?> get props => [index];
}
