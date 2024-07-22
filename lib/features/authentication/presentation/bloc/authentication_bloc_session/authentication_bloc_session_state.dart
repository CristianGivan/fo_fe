part of 'authentication_bloc_session.dart';

abstract class AuthenticationBlocSessionState extends Equatable {
  const AuthenticationBlocSessionState();

  @override
  List<Object> get props => [];
}

class AuthenticationSessionInitial extends AuthenticationBlocSessionState {}

class AuthenticationSessionLoading extends AuthenticationBlocSessionState {}

class AuthenticationSessionAuthenticated
    extends AuthenticationBlocSessionState {
  final AuthenticationEntity authEntity;

  const AuthenticationSessionAuthenticated({required this.authEntity});

  @override
  List<Object> get props => [authEntity];
}

class AuthenticationUserIdLoaded extends AuthenticationBlocSessionState {
  final int userId;

  const AuthenticationUserIdLoaded({required this.userId});

  @override
  List<Object> get props => [userId];
}

class AuthenticationSessionError extends AuthenticationBlocSessionState {
  final String message;

  const AuthenticationSessionError(this.message);

  @override
  List<Object> get props => [message];
}
