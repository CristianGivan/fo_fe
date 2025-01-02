part of 'task_bloc.dart';

class TaskItemsSortBlocEvent<P> extends OrganizerBlocEvent {
  final P sortParams;

  const TaskItemsSortBlocEvent({
    required this.sortParams,
  });

  @override
  List<Object> get props => [sortParams as Object];
}

class TaskItemsFilterBlocEvent<P> extends OrganizerBlocEvent {
  final P filterParams;

  const TaskItemsFilterBlocEvent({
    required this.filterParams,
  });

  @override
  List<Object> get props => [filterParams as Object];
}

class UpdateTaskBlocEvent<P> extends OrganizerBlocEvent {
  final P params;

  const UpdateTaskBlocEvent(this.params);

  @override
  List<Object> get props => [params as Object];
}

class ExportTaskToExcelBlocEvent extends OrganizerBlocEvent {
  final int forUserId;

  const ExportTaskToExcelBlocEvent(this.forUserId);

  @override
  List<Object> get props => [forUserId];
}
