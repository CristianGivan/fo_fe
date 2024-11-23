part of 'auth_log_bloc.dart';

abstract class AuthLogBlocEvent extends Equatable {
  const AuthLogBlocEvent();

  @override
  List<Object?> get props => [];
}

class AuthLogInBlocEvent extends AuthLogBlocEvent {
  final String email;
  final String password;

  const AuthLogInBlocEvent({required this.email, required this.password});

  @override
  List<Object?> get props => [email, password];
}

class AuthLogInAutoBlocEvent extends AuthLogBlocEvent {}

class AuthLogSwitchBlocEvent extends AuthLogBlocEvent {
  final int userId;
  final DeviceInfo deviceInfo;

  const AuthLogSwitchBlocEvent({required this.userId, required this.deviceInfo});

  @override
  List<Object?> get props => [userId, deviceInfo];
}

class AuthLogOutBlocEvent extends AuthLogBlocEvent {
  final int authId;

  const AuthLogOutBlocEvent({required this.authId});

  @override
  List<Object?> get props => [authId];
}

/// Event triggered for handling failures in any login-related operation (optional).
class AuthLogFailureEvent extends AuthLogBlocEvent {
  final String errorMessage;

  const AuthLogFailureEvent({required this.errorMessage});

  @override
  List<Object?> get props => [errorMessage];
}

/// Event triggered to retry a failed authentication operation (optional).
class AuthRetryLogEvent extends AuthLogBlocEvent {}
