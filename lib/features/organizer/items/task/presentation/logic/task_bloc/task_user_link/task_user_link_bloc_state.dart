part of '../task_bloc.dart';

abstract class TaskUserLinkBlocState extends Equatable {
  const TaskUserLinkBlocState();

  @override
  List<Object> get props => [];
}

class TaskUserLoadingBlocState extends TaskUserLinkBlocState {}

class TaskUserLoadedBlocState extends TaskUserLinkBlocState {
  final OrganizerItems<UserEntity> users;

  TaskUserLoadedBlocState(this.users);

  @override
  List<Object> get props => [users];
}

class UserItemsUpdatedToTaskBlocState extends TaskUserLinkBlocState {
  final OrganizerItems<UserEntity> userItemsUpdated;

  UserItemsUpdatedToTaskBlocState(this.userItemsUpdated);

  @override
  List<Object> get props => [userItemsUpdated];
}

class TaskUserErrorBlocState extends TaskUserLinkBlocState {
  final String message;

  TaskUserErrorBlocState(this.message);

  @override
  List<Object> get props => [message];
}
