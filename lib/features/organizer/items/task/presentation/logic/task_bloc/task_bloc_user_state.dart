part of 'task_bloc.dart';

abstract class TaskBlocUserState extends Equatable {
  const TaskBlocUserState();

  @override
  List<Object> get props => [];
}

class UserLoadingBlocState extends TaskBlocUserState {}

class UserLoadedBlocState extends TaskBlocUserState {
  final List<UserEntity> users;

  UserLoadedBlocState(this.users);

  @override
  List<Object> get props => [users];
}

class UserAddedToTaskBlocState extends TaskBlocUserState {}

class UserDeletedFromTaskBlocState extends TaskBlocUserState {}

class UserErrorBlocState extends TaskBlocUserState {
  final String message;

  UserErrorBlocState(this.message);

  @override
  List<Object> get props => [message];
}
