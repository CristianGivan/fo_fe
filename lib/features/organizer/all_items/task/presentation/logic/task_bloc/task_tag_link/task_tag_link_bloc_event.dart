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
