part of 'task_bloc.dart';

class TaskItemsSortBlocEvent extends OrganizerBlocEvent {
  final SortTasksParams sortParams;

  const TaskItemsSortBlocEvent({
    required this.sortParams,
  });

  @override
  List<Object> get props => [sortParams];
}

class TaskItemsFilterBlocEvent extends OrganizerBlocEvent {
  final FilterTasksParams filterParams;

  const TaskItemsFilterBlocEvent({
    required this.filterParams,
  });

  @override
  List<Object> get props => [filterParams];
}

class TaskAddBlocEvent extends OrganizerBlocEvent {
  final TaskEntity task;

  const TaskAddBlocEvent(this.task);

  @override
  List<Object> get props => [task];
}

class TaskUpdateBlocEvent extends OrganizerBlocEvent {
  final TaskEntity task;

  const TaskUpdateBlocEvent(this.task);

  @override
  List<Object> get props => [task];
}

class TaskDisplayItemsUpdatedBlocEvent extends OrganizerBlocEvent {
  final ItemEntity updatedDisplayedTasks;

  const TaskDisplayItemsUpdatedBlocEvent(this.updatedDisplayedTasks);

  @override
  List<Object> get props => [updatedDisplayedTasks];
}

class TaskDeleteBlocEvent extends OrganizerBlocEvent {
  final int taskId;

  const TaskDeleteBlocEvent(this.taskId);

  @override
  List<Object> get props => [taskId];
}
