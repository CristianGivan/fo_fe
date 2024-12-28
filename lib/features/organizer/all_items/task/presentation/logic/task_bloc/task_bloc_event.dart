part of 'task_bloc.dart';

class TaskItemsSortBlocEvent<T, P> extends OrganizerBlocEvent<T> {
  final P sortParams;

  const TaskItemsSortBlocEvent({
    required this.sortParams,
  });

  @override
  List<Object> get props => [sortParams as Object];
}

class TaskItemsFilterBlocEvent<T, P> extends OrganizerBlocEvent<T> {
  final P filterParams;

  const TaskItemsFilterBlocEvent({
    required this.filterParams,
  });

  @override
  List<Object> get props => [filterParams as Object];
}

class UpdateTaskBlocEvent<ItemEntity, P> extends OrganizerBlocEvent<ItemEntity> {
  final P params;

  const UpdateTaskBlocEvent(this.params);

  @override
  List<Object> get props => [params as Object];
}
