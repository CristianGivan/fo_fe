part of 'authentication_sign_up.dart';

abstract class AuthenticationSignUpBlocEvent extends Equatable {
  const AuthenticationSignUpBlocEvent();

  @override
  List<Object> get props => [];
}

class AuthSignUpBlocEvent extends AuthenticationSignUpBlocEvent {
  final UserEntity user;

  const AuthSignUpBlocEvent({required this.user});

  @override
  List<Object> get props => [user];
}

class EmailChanged extends AuthenticationSignUpBlocEvent {
  final String email;

  const EmailChanged(this.email);

  @override
  List<Object> get props => [email];
}

class PasswordChanged extends AuthenticationSignUpBlocEvent {
  final String password;

  const PasswordChanged(this.password);

  @override
  List<Object> get props => [password];
}

class NameChanged extends AuthenticationSignUpBlocEvent {
  final String name;

  const NameChanged(this.name);

  @override
  List<Object> get props => [name];
}

class ValidateForm extends AuthenticationSignUpBlocEvent {}
