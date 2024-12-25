part of 'task_bloc.dart';

abstract class TaskBlocEvent extends Equatable {
  const TaskBlocEvent();

  @override
  List<Object> get props => [];
}

class GetTaskItemsFromLogInUserBlocEvent extends TaskBlocEvent {
  final TaskParams taskParams;

  const GetTaskItemsFromLogInUserBlocEvent(this.taskParams);

  @override
  List<Object> get props => [taskParams];
}

class TaskItemsSortBlocEvent extends TaskBlocEvent {
  final SortTasksParams sortParams;

  const TaskItemsSortBlocEvent({
    required this.sortParams,
  });

  @override
  List<Object> get props => [sortParams];
}

class TaskItemsFilterBlocEvent extends TaskBlocEvent {
  final FilterTasksParams filterParams;

  const TaskItemsFilterBlocEvent({
    required this.filterParams,
  });

  @override
  List<Object> get props => [filterParams];
}

class TaskAddBlocEvent extends TaskBlocEvent {
  final TaskEntity task;

  const TaskAddBlocEvent(this.task);

  @override
  List<Object> get props => [task];
}

class TaskUpdateBlocEvent extends TaskBlocEvent {
  final TaskEntity task;

  const TaskUpdateBlocEvent(this.task);

  @override
  List<Object> get props => [task];
}

class TaskDisplayItemsUpdatedBlocEvent extends TaskBlocEvent {
  final ItemEntity updatedDisplayedTasks;

  const TaskDisplayItemsUpdatedBlocEvent(this.updatedDisplayedTasks);

  @override
  List<Object> get props => [updatedDisplayedTasks];
}

class TaskDeleteBlocEvent extends TaskBlocEvent {
  final int taskId;

  const TaskDeleteBlocEvent(this.taskId);

  @override
  List<Object> get props => [taskId];
}
