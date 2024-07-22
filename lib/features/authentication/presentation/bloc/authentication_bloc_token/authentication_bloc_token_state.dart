part of 'authentication_bloc_token.dart';

abstract class AuthenticationBlocTokenState extends Equatable {
  const AuthenticationBlocTokenState();

  @override
  List<Object> get props => [];
}

class AuthenticationTokenInitial extends AuthenticationBlocTokenState {}

class AuthenticationTokenLoading extends AuthenticationBlocTokenState {}

class AuthenticationTokenSuccess extends AuthenticationBlocTokenState {}

class AuthenticationTokenAuthenticated extends AuthenticationBlocTokenState {
  final AuthenticationEntity authEntity;

  const AuthenticationTokenAuthenticated({required this.authEntity});

  @override
  List<Object> get props => [authEntity];
}

class AuthenticationTokenError extends AuthenticationBlocTokenState {
  final String message;

  const AuthenticationTokenError(this.message);

  @override
  List<Object> get props => [message];
}
