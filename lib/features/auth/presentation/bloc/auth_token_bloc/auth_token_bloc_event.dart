part of 'auth_token_bloc.dart';

abstract class AuthTokenBlocEvent extends Equatable {
  const AuthTokenBlocEvent();

  @override
  List<Object> get props => [];
}

class LogoutBlocEvent extends AuthTokenBlocEvent {
  final int authId;

  const LogoutBlocEvent({required this.authId});

  @override
  List<Object> get props => [authId];
}

class RefreshTokenBlocEvent extends AuthTokenBlocEvent {
  final int authId;

  const RefreshTokenBlocEvent({required this.authId});

  @override
  List<Object> get props => [authId];
}
