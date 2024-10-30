part of '../task_bloc.dart';

abstract class TaskBlocUserEvent extends Equatable {
  const TaskBlocUserEvent();

  @override
  List<Object> get props => [];
}

class GetUsersByTaskIdBlocEvent extends TaskBlocUserEvent {
  final int taskId;

  GetUsersByTaskIdBlocEvent(this.taskId);

  @override
  List<Object> get props => [taskId];
}

class AddUserToTaskBlocEvent extends TaskBlocUserEvent {
  final int taskId;
  final UserEntity user;

  AddUserToTaskBlocEvent(this.taskId, this.user);

  @override
  List<Object> get props => [taskId, user];
}

class DeleteUserFromTaskBlocEvent extends TaskBlocUserEvent {
  final int taskId;
  final int userId;

  DeleteUserFromTaskBlocEvent(this.taskId, this.userId);

  @override
  List<Object> get props => [taskId, userId];
}
