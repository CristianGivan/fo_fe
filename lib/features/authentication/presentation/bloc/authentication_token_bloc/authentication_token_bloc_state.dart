part of 'authentication_token_bloc.dart';

abstract class AuthenticationTokenBlocState extends Equatable {
  const AuthenticationTokenBlocState();

  @override
  List<Object> get props => [];
}

class AuthenticationTokenInitial extends AuthenticationTokenBlocState {}

class AuthenticationTokenLoading extends AuthenticationTokenBlocState {}

class AuthenticationTokenSuccess extends AuthenticationTokenBlocState {}

class AuthenticationTokenAuthenticated extends AuthenticationTokenBlocState {
  final AuthEntity authEntity;

  const AuthenticationTokenAuthenticated({required this.authEntity});

  @override
  List<Object> get props => [authEntity];
}

class AuthenticationTokenError extends AuthenticationTokenBlocState {
  final String message;

  const AuthenticationTokenError(this.message);

  @override
  List<Object> get props => [message];
}
