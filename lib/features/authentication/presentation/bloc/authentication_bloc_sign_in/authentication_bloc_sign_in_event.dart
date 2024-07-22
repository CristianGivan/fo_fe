part of 'authentication_bloc_sign_in.dart';

abstract class AuthenticationBlocSignInEvent extends Equatable {
  const AuthenticationBlocSignInEvent();

  @override
  List<Object> get props => [];
}

class SignUpEvent extends AuthenticationBlocSignInEvent {
  final String name;
  final String email;
  final String password;

  const SignUpEvent(
      {required this.name, required this.email, required this.password});

  @override
  List<Object> get props => [name, email, password];
}

class LoginEvent extends AuthenticationBlocSignInEvent {
  final String email;
  final String password;

  const LoginEvent({required this.email, required this.password});

  @override
  List<Object> get props => [email, password];
}
