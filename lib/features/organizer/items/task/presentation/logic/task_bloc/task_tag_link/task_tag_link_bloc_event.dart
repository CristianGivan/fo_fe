part of '../task_bloc.dart';

abstract class TaskTagLinkBlocEvent extends Equatable {
  const TaskTagLinkBlocEvent();

  @override
  List<Object> get props => [];
}

class GetTagItemsByTaskIdBlocEvent extends TaskTagLinkBlocEvent {
  final int taskId;

  GetTagItemsByTaskIdBlocEvent(this.taskId);

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
  final IdSet tagIds;

  AddTagItemsToTaskBlocEvent({required this.taskId, required this.tagIds});

  @override
  List<Object> get props => [taskId, tagIds];
}

class UpdateTagItemsOfTaskBlocEvent extends TaskTagLinkBlocEvent {
  final int taskId;
  final OrganizerItems<TagEntity> tagItems;
  final OrganizerItems<TagEntity> updatedTagItems;

  UpdateTagItemsOfTaskBlocEvent({
    required this.taskId,
    required this.tagItems,
    required this.updatedTagItems,
  });

  @override
  List<Object> get props => [taskId, tagItems, updatedTagItems];
}

class DeleteTagFromTaskBlocEvent extends TaskTagLinkBlocEvent {
  final int taskId;
  final int tagId;

  DeleteTagFromTaskBlocEvent(this.taskId, this.tagId);

  @override
  List<Object> get props => [taskId, tagId];
}

class DeleteTagItemsToTaskBlocEvent extends TaskTagLinkBlocEvent {
  final int taskId;
  final IdSet tagIds;

  DeleteTagItemsToTaskBlocEvent({required this.taskId, required this.tagIds});

  @override
  List<Object> get props => [taskId, tagIds];
}
