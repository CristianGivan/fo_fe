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
