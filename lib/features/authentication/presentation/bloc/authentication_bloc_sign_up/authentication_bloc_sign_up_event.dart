part of 'authentication_bloc_sign_up.dart';

abstract class AuthenticationBlocSignUpEvent extends Equatable {
  const AuthenticationBlocSignUpEvent();

  @override
  List<Object> get props => [];
}

class SignUpBlocEvent extends AuthenticationBlocSignUpEvent {
  final String name;
  final String email;
  final String password;

  const SignUpBlocEvent({
    required this.name,
    required this.email,
    required this.password,
  });

  @override
  List<Object> get props => [name, email, password];
}

class EmailChanged extends AuthenticationBlocSignUpEvent {
  final String email;

  const EmailChanged(this.email);

  @override
  List<Object> get props => [email];
}

class PasswordChanged extends AuthenticationBlocSignUpEvent {
  final String password;

  const PasswordChanged(this.password);

  @override
  List<Object> get props => [password];
}

class NameChanged extends AuthenticationBlocSignUpEvent {
  final String name;

  const NameChanged(this.name);

  @override
  List<Object> get props => [name];
}

class ValidateForm extends AuthenticationBlocSignUpEvent {}
