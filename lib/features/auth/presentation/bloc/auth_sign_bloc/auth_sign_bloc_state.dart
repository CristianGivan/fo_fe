part of 'auth_sign_bloc.dart';

abstract class AuthSignBlocState extends Equatable {
  const AuthSignBlocState();

  @override
  List<Object> get props => [];
}

class AuthSignInitialBlocState extends AuthSignBlocState {}

class AuthSignLoadingBlocState extends AuthSignBlocState {}

class AuthSignUpSuccessBlocState extends AuthSignBlocState {
  final AuthEntity authEntity;

  const AuthSignUpSuccessBlocState({required this.authEntity});

  @override
  List<Object> get props => [authEntity];
}

class AuthSignInSuccessBlocState extends AuthSignBlocState {
  final AuthEntity authEntity;

  const AuthSignInSuccessBlocState({required this.authEntity});

  @override
  List<Object> get props => [authEntity];
}

class AuthSignInAutoSuccessBlocState extends AuthSignBlocState {
  final AuthEntity authEntity;

  const AuthSignInAutoSuccessBlocState({required this.authEntity});

  @override
  List<Object> get props => [authEntity];
}

class AuthSignOutSuccessBlocState extends AuthSignBlocState {}

class AuthUserIdLoadedBlocState extends AuthSignBlocState {
  final int userId;

  const AuthUserIdLoadedBlocState({required this.userId});

  @override
  List<Object> get props => [userId];
}

class AuthSignFailedBlocState extends AuthSignBlocState {
  final String error;

  const AuthSignFailedBlocState(this.error);

  @override
  List<Object> get props => [error];
}

class AuthSignErrorBlocState extends AuthSignBlocState {
  final String message;

  const AuthSignErrorBlocState(this.message);

  @override
  List<Object> get props => [message];
}
