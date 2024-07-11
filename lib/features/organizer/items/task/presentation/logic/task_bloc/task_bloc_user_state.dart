part of 'task_bloc.dart';

abstract class TaskUserBlocState extends Equatable {
  const TaskUserBlocState();

  @override
  List<Object> get props => [];
}

class UserLoadingBlocState extends TaskUserBlocState {}

class UserLoadedBlocState extends TaskUserBlocState {
  final List<UserEntity> users;

  UserLoadedBlocState(this.users);

  @override
  List<Object> get props => [users];
}

class UserAddedToTaskBlocState extends TaskUserBlocState {}

class UserDeletedFromTaskBlocState extends TaskUserBlocState {}

class UserErrorBlocState extends TaskUserBlocState {
  final String message;

  UserErrorBlocState(this.message);

  @override
  List<Object> get props => [message];
}
