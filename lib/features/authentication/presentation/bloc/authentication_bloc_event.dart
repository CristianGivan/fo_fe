part of 'authentication_bloc.dart';

abstract class AuthenticationBlocEvent extends Equatable {
  const AuthenticationBlocEvent();

  @override
  List<Object?> get props => [];
}

class AutoLoginBlocEvent extends AuthenticationBlocEvent {
  final String deviceInfo;

  const AutoLoginBlocEvent({required this.deviceInfo});

  @override
  List<Object?> get props => [deviceInfo];
}

class GetLoggedInUserIdBlocEvent extends AuthenticationBlocEvent {
  final String deviceInfo;

  const GetLoggedInUserIdBlocEvent({required this.deviceInfo});

  @override
  List<Object?> get props => [deviceInfo];
}

class LoginBlocEvent extends AuthenticationBlocEvent {
  final String email;
  final String password;
  final String deviceInfo;

  const LoginBlocEvent(
      {required this.email, required this.password, required this.deviceInfo});

  @override
  List<Object?> get props => [email, password];
}

class LogoutBlocEvent extends AuthenticationBlocEvent {
  final int authId;

  LogoutBlocEvent({required this.authId});

  List<Object?> get props => [authId];
}

class RefreshTokenBlocEvent extends AuthenticationBlocEvent {
  final int authId;

  RefreshTokenBlocEvent({required this.authId});

  @override
  List<Object?> get props => [authId];
}

class SwitchUserBlocEvent extends AuthenticationBlocEvent {
  final int userId;
  final String deviceInfo;

  const SwitchUserBlocEvent({required this.userId, required this.deviceInfo});

  @override
  List<Object?> get props => [userId];
}
