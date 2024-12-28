part of '../task_bloc.dart';

abstract class TaskUserLinkBlocEvent extends Equatable {
  const TaskUserLinkBlocEvent();

  @override
  List<Object> get props => [];
}

class GetUserItemsByTaskIdBlocEvent extends TaskUserLinkBlocEvent {
  final int taskId;

  GetUserItemsByTaskIdBlocEvent(this.taskId);

  @override
  List<Object> get props => [taskId];
}

class GetCreatorByTaskIdBlocEvent extends TaskUserLinkBlocEvent {
  final int taskId;

  GetCreatorByTaskIdBlocEvent(this.taskId);

  @override
  List<Object> get props => [taskId];
}

class UpdateUserItemsOfTaskBlocEvent extends TaskUserLinkBlocEvent {
  final int taskId;
  final OrganizerItems<UserEntity> userItems;
  final OrganizerItems<UserEntity> updatedUserItems;

  UpdateUserItemsOfTaskBlocEvent({
    required this.taskId,
    required this.userItems,
    required this.updatedUserItems,
  });

  @override
  List<Object> get props => [taskId, userItems, updatedUserItems];
}

class UpdateTaskUserLinkBlocEvent extends TaskUserLinkBlocEvent {
  final TaskUserLinkEntity taskUserLink;

  const UpdateTaskUserLinkBlocEvent(this.taskUserLink);

  @override
  List<Object> get props => [taskUserLink];
}
