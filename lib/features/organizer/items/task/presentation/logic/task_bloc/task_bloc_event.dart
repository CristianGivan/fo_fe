part of 'task_bloc.dart';

abstract class TaskBlocEvent extends Equatable {
  const TaskBlocEvent();

  @override
  List<Object> get props => [];
}

class TaskGetByIdBlocEvent extends TaskBlocEvent {
  final int taskId;

  TaskGetByIdBlocEvent(this.taskId);

  @override
  List<Object> get props => [taskId];
}

class TaskItemsGetAllBlocEvent extends TaskBlocEvent {}

class GetTaskItemsFromLogInUserBlocEvent extends TaskBlocEvent {
  final TaskParams taskParams;

  const GetTaskItemsFromLogInUserBlocEvent(this.taskParams);

  @override
  List<Object> get props => [taskParams];
}

class TaskLoadItemsByIdSetBlocEvent extends TaskBlocEvent {
  final IdSet idSet;

  TaskLoadItemsByIdSetBlocEvent(this.idSet);

  @override
  List<Object> get props => [idSet];
}

class TaskItemsSortBlocEvent extends TaskBlocEvent {
  final SortTasksParams sortParams;

  TaskItemsSortBlocEvent({
    required this.sortParams,
  });

  @override
  List<Object> get props => [sortParams];
}

class TaskItemsFilterBlocEvent extends TaskBlocEvent {
  final FilterTasksParams filterParams;

  TaskItemsFilterBlocEvent({
    required this.filterParams,
  });

  @override
  List<Object> get props => [filterParams];
}

class TaskAddBlocEvent extends TaskBlocEvent {
  final TaskEntity task;

  TaskAddBlocEvent(this.task);

  @override
  List<Object> get props => [task];
}

class TaskUpdateBlocEvent extends TaskBlocEvent {
  final TaskEntity task;

  TaskUpdateBlocEvent(this.task);

  @override
  List<Object> get props => [task];
}

class TaskDeleteBlocEvent extends TaskBlocEvent {
  final int taskId;

  TaskDeleteBlocEvent(this.taskId);

  @override
  List<Object> get props => [taskId];
}
