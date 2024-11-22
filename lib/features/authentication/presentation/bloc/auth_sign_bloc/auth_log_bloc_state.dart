part of 'auth_log_bloc.dart';

abstract class AuthSignBlocState extends Equatable {
  const AuthSignBlocState();

  @override
  List<Object> get props => [];
}

class AuthLogInitialBlocState extends AuthSignBlocState {}

class AuthLogLoadingBlocState extends AuthSignBlocState {}

class AuthLogInSuccessBlocState extends AuthSignBlocState {
  final AuthEntity authEntity;

  const AuthLogInSuccessBlocState({required this.authEntity});

  @override
  List<Object> get props => [authEntity];
}

class AuthLogInAutoSuccessBlocState extends AuthSignBlocState {
  final AuthEntity authEntity;

  const AuthLogInAutoSuccessBlocState({required this.authEntity});

  @override
  List<Object> get props => [authEntity];
}

class AuthLogOutSuccessBlocState extends AuthSignBlocState {}

class AuthUserIdLoadedBlocState extends AuthSignBlocState {
  final int userId;

  const AuthUserIdLoadedBlocState({required this.userId});

  @override
  List<Object> get props => [userId];
}

class AuthLogFailedBlocState extends AuthSignBlocState {
  final String error;

  const AuthLogFailedBlocState(this.error);

  @override
  List<Object> get props => [error];
}

class AuthLogErrorBlocState extends AuthSignBlocState {
  final String message;

  const AuthLogErrorBlocState(this.message);

  @override
  List<Object> get props => [message];
}
