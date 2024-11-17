part of 'auth_sign_bloc.dart';

abstract class AuthSignBlocEvent extends Equatable {
  const AuthSignBlocEvent();

  @override
  List<Object> get props => [];
}

class AuthSignUpBlocEvent extends AuthSignBlocEvent {
  final UserEntity user;
  final isAutoSignIn;

  const AuthSignUpBlocEvent({
    required this.user,
    required this.isAutoSignIn,
  });

  @override
  List<Object> get props => [user, isAutoSignIn];
}

class AuthSignInBlocEvent extends AuthSignBlocEvent {
  final String email;
  final String password;

  const AuthSignInBlocEvent({required this.email, required this.password});

  @override
  List<Object> get props => [email, password];
}

class AuthSignInAutoBlocEvent extends AuthSignBlocEvent {}

class AuthSignOutBlocEvent extends AuthSignBlocEvent {
  final int authId;

  const AuthSignOutBlocEvent({required this.authId});

  @override
  List<Object> get props => [authId];
}

class AuthSwitchUserBlocEvent extends AuthSignBlocEvent {
  final int userId;
  final DeviceInfo deviceInfo;

  const AuthSwitchUserBlocEvent({required this.userId, required this.deviceInfo});

  @override
  List<Object> get props => [userId, deviceInfo];
}

class AuthGetSignInUserIdBlocEvent extends AuthSignBlocEvent {
  final DeviceInfo deviceInfo;

  const AuthGetSignInUserIdBlocEvent({required this.deviceInfo});

  @override
  List<Object> get props => [deviceInfo];
}
