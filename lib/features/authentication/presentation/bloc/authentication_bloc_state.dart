part of 'authentication_bloc.dart';

abstract class AuthenticationBlocState extends Equatable {
  const AuthenticationBlocState();

  @override
  List<Object?> get props => [];
}

class AuthenticationInitialBlocState extends AuthenticationBlocState {}

class AuthenticationLoadingBlocState extends AuthenticationBlocState {}

class AuthenticationAuthenticatedBlocState extends AuthenticationBlocState {
  final AuthenticationEntity authEntity;

  const AuthenticationAuthenticatedBlocState({required this.authEntity});

  @override
  List<Object?> get props => [authEntity];
}

class AuthenticationUserIdLoadedBlocState extends AuthenticationBlocState {
  final int userId;

  const AuthenticationUserIdLoadedBlocState({required this.userId});

  @override
  List<Object?> get props => [userId];
}

class AuthenticationUnauthenticatedBlocState extends AuthenticationBlocState {}

class AuthenticationErrorBlocState extends AuthenticationBlocState {
  final String message;

  const AuthenticationErrorBlocState(this.message);

  @override
  List<Object?> get props => [message];
}
