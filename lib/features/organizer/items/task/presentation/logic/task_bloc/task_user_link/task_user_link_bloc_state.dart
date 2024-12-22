part of '../task_bloc.dart';

abstract class TaskUserLinkBlocState extends Equatable {
  const TaskUserLinkBlocState();

  @override
  List<Object> get props => [];
}

class TaskUserLoadingBlocState extends TaskUserLinkBlocState {}

class TaskUserLinkLoadedBlocState extends TaskUserLinkBlocState {
  final TaskUserLinkEntity taskUserLink;

  const TaskUserLinkLoadedBlocState(this.taskUserLink);

  @override
  List<Object> get props => [taskUserLink];
}

class TaskUserLoadedBlocState extends TaskUserLinkBlocState {
  final OrganizerItems<UserEntity> userItems;

  const TaskUserLoadedBlocState(this.userItems);

  @override
  List<Object> get props => [userItems];
}

class UserItemsUpdatedToTaskBlocState extends TaskUserLinkBlocState {
  final OrganizerItems<UserEntity> userItemsUpdated;

  const UserItemsUpdatedToTaskBlocState(this.userItemsUpdated);

  @override
  List<Object> get props => [userItemsUpdated];
}

class TaskUserErrorBlocState extends TaskUserLinkBlocState {
  final String message;

  const TaskUserErrorBlocState(this.message);

  @override
  List<Object> get props => [message];
}
