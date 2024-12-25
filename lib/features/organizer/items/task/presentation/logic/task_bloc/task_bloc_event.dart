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
