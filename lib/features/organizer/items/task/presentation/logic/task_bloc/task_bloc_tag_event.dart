part of 'task_bloc.dart';

abstract class TaskBlocTagEvent extends Equatable {
  const TaskBlocTagEvent();

  @override
  List<Object> get props => [];
}

class GetTagsByTaskIdBlocEvent extends TaskBlocTagEvent {
  final int taskId;

  GetTagsByTaskIdBlocEvent(this.taskId);

  @override
  List<Object> get props => [taskId];
}

class AddTagToTaskBlocEvent extends TaskBlocTagEvent {
  final int taskId;
  final TagEntity tag;

  AddTagToTaskBlocEvent({required this.taskId, required this.tag});

  @override
  List<Object> get props => [taskId, tag];
}

class AddTagItemsToTaskBlocEvent extends TaskBlocTagEvent {
  final int taskId;
  final List<int> tags;

  AddTagItemsToTaskBlocEvent({required this.taskId, required this.tags});

  @override
  List<Object> get props => [taskId, tags];
}

class DeleteTagFromTaskBlocEvent extends TaskBlocTagEvent {
  final int taskId;
  final int tagId;

  DeleteTagFromTaskBlocEvent(this.taskId, this.tagId);

  @override
  List<Object> get props => [taskId, tagId];
}
