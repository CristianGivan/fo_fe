part of 'auth_token_bloc.dart';

abstract class AuthTokenBlocState extends Equatable {
  const AuthTokenBlocState();

  @override
  List<Object> get props => [];
}

class AuthTokenInitial extends AuthTokenBlocState {}

class AuthTokenLoading extends AuthTokenBlocState {}

class AuthTokenSuccess extends AuthTokenBlocState {}

class AuthTokenAuthenticated extends AuthTokenBlocState {
  final AuthEntity authEntity;

  const AuthTokenAuthenticated({required this.authEntity});

  @override
  List<Object> get props => [authEntity];
}

class AuthTokenError extends AuthTokenBlocState {
  final String message;

  const AuthTokenError(this.message);

  @override
  List<Object> get props => [message];
}
