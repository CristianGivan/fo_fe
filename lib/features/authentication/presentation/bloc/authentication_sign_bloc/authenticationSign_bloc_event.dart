part of 'authentication_sign_bloc.dart';

abstract class AuthenticationSignBlocEvent extends Equatable {
  const AuthenticationSignBlocEvent();

  @override
  List<Object> get props => [];
}

class AuthSignUpBlocEvent extends AuthenticationSignBlocEvent {
  final UserEntity user;

  const AuthSignUpBlocEvent({required this.user});

  @override
  List<Object> get props => [user];
}

class AuthSignInBlocEvent extends AuthenticationSignBlocEvent {
  final String email;
  final String password;

  const AuthSignInBlocEvent({required this.email, required this.password});

  @override
  List<Object> get props => [email, password];
}

class AuthSignInAutoBlocEvent extends AuthenticationSignBlocEvent {}

class AuthSignOutBlocEvent extends AuthenticationSignBlocEvent {
  final int authId;

  const AuthSignOutBlocEvent({required this.authId});

  @override
  List<Object> get props => [authId];
}

class AuthSwitchUserBlocEvent extends AuthenticationSignBlocEvent {
  final int userId;
  final DeviceInfo deviceInfo;

  const AuthSwitchUserBlocEvent({required this.userId, required this.deviceInfo});

  @override
  List<Object> get props => [userId, deviceInfo];
}

class AuthGetSignInUserIdBlocEvent extends AuthenticationSignBlocEvent {
  final DeviceInfo deviceInfo;

  const AuthGetSignInUserIdBlocEvent({required this.deviceInfo});

  @override
  List<Object> get props => [deviceInfo];
}
