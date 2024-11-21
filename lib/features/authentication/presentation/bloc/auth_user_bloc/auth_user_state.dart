part of 'auth_user_bloc.dart';

abstract class AuthUserState extends Equatable {
  const AuthUserState();

  @override
  List<Object> get props => [];
}

class AuthUserIdInitialState extends AuthUserState {}

class AuthUserIdLoadingState extends AuthUserState {}

class AuthUserIdLoadedState extends AuthUserState {
  final int userId;

  const AuthUserIdLoadedState({required this.userId});

  @override
  List<Object> get props => [userId];
}

class AuthUserIdFailedState extends AuthUserState {
  final String error;

  const AuthUserIdFailedState(this.error);

  @override
  List<Object> get props => [error];
}
