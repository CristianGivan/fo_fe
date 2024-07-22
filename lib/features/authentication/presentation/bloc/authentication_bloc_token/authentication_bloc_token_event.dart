part of 'authentication_bloc_token.dart';

abstract class AuthenticationBlocTokenEvent extends Equatable {
  const AuthenticationBlocTokenEvent();

  @override
  List<Object> get props => [];
}

class LogoutBlocEvent extends AuthenticationBlocTokenEvent {
  final int authId;

  const LogoutBlocEvent({required this.authId});

  @override
  List<Object> get props => [authId];
}

class RefreshTokenBlocEvent extends AuthenticationBlocTokenEvent {
  final int authId;

  const RefreshTokenBlocEvent({required this.authId});

  @override
  List<Object> get props => [authId];
}
