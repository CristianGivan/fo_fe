part of 'authentication_token_bloc.dart';

abstract class AuthenticationTokenBlocEvent extends Equatable {
  const AuthenticationTokenBlocEvent();

  @override
  List<Object> get props => [];
}

class LogoutBlocEvent extends AuthenticationTokenBlocEvent {
  final int authId;

  const LogoutBlocEvent({required this.authId});

  @override
  List<Object> get props => [authId];
}

class RefreshTokenBlocEvent extends AuthenticationTokenBlocEvent {
  final int authId;

  const RefreshTokenBlocEvent({required this.authId});

  @override
  List<Object> get props => [authId];
}
