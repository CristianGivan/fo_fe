part of '../task_bloc.dart';

abstract class TaskTagLinkBlocEvent extends Equatable {
  const TaskTagLinkBlocEvent();

  @override
  List<Object> get props => [];
}

class GetTagsByTaskIdBlocEvent extends TaskTagLinkBlocEvent {
  final int taskId;

  GetTagsByTaskIdBlocEvent(this.taskId);

  @override
  List<Object> get props => [taskId];
}

class AddTagToTaskBlocEvent extends TaskTagLinkBlocEvent {
  final int taskId;
  final TagEntity tag;

  AddTagToTaskBlocEvent({required this.taskId, required this.tag});

  @override
  List<Object> get props => [taskId, tag];
}

class AddTagItemsToTaskBlocEvent extends TaskTagLinkBlocEvent {
  final int taskId;
  final List<int> tags;

  AddTagItemsToTaskBlocEvent({required this.taskId, required this.tags});

  @override
  List<Object> get props => [taskId, tags];
}

class DeleteTagFromTaskBlocEvent extends TaskTagLinkBlocEvent {
  final int taskId;
  final int tagId;

  DeleteTagFromTaskBlocEvent(this.taskId, this.tagId);

  @override
  List<Object> get props => [taskId, tagId];
}
