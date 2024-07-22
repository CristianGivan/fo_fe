part of 'authentication_bloc_session.dart';

abstract class AuthenticationBlocSessionEvent extends Equatable {
  const AuthenticationBlocSessionEvent();

  @override
  List<Object> get props => [];
}

class AutoLoginBlocEvent extends AuthenticationBlocSessionEvent {}

class GetLoggedInUserIdBlocEvent extends AuthenticationBlocSessionEvent {
  final DeviceInfo deviceInfo;

  const GetLoggedInUserIdBlocEvent({required this.deviceInfo});

  @override
  List<Object> get props => [deviceInfo];
}

class SwitchUserBlocEvent extends AuthenticationBlocSessionEvent {
  final int userId;
  final DeviceInfo deviceInfo;

  const SwitchUserBlocEvent({required this.userId, required this.deviceInfo});

  @override
  List<Object> get props => [userId, deviceInfo];
}
