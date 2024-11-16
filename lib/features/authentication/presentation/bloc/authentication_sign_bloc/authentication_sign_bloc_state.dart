part of 'authentication_sign_bloc.dart';

abstract class AuthenticationSignBlocState extends Equatable {
  const AuthenticationSignBlocState();

  @override
  List<Object> get props => [];
}

class AuthSignInitialBlocState extends AuthenticationSignBlocState {}

class AuthSignLoadingBlocState extends AuthenticationSignBlocState {}

class AuthSignUpSuccessBlocState extends AuthenticationSignBlocState {
  final AuthEntity authEntity;

  const AuthSignUpSuccessBlocState({required this.authEntity});

  @override
  List<Object> get props => [authEntity];
}

class AuthSignInSuccessBlocState extends AuthenticationSignBlocState {
  final AuthEntity authEntity;

  const AuthSignInSuccessBlocState({required this.authEntity});

  @override
  List<Object> get props => [authEntity];
}

class AuthSignInAutoSuccessBlocState extends AuthenticationSignBlocState {
  final AuthEntity authEntity;

  const AuthSignInAutoSuccessBlocState({required this.authEntity});

  @override
  List<Object> get props => [authEntity];
}

class AuthSignOutSuccessBlocState extends AuthenticationSignBlocState {}

class AuthUserIdLoadedBlocState extends AuthenticationSignBlocState {
  final int userId;

  const AuthUserIdLoadedBlocState({required this.userId});

  @override
  List<Object> get props => [userId];
}

class AuthSignFailedBlocState extends AuthenticationSignBlocState {
  final String error;

  const AuthSignFailedBlocState(this.error);

  @override
  List<Object> get props => [error];
}

class AuthSignErrorBlocState extends AuthenticationSignBlocState {
  final String message;

  const AuthSignErrorBlocState(this.message);

  @override
  List<Object> get props => [message];
}
