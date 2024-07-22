part of 'authentication_bloc_sign_up.dart';

abstract class AuthenticationBlocSignUpState extends Equatable {
  const AuthenticationBlocSignUpState();

  @override
  List<Object> get props => [];
}

class AuthenticationSignUpInitial extends AuthenticationBlocSignUpState {}

class AuthenticationSignUpLoading extends AuthenticationBlocSignUpState {}

class AuthenticationSignUpSuccess extends AuthenticationBlocSignUpState {
  final AuthenticationEntity authEntity;

  const AuthenticationSignUpSuccess({required this.authEntity});

  @override
  List<Object> get props => [authEntity];
}

class AuthenticationSignUpError extends AuthenticationBlocSignUpState {
  final String message;

  const AuthenticationSignUpError(this.message);

  @override
  List<Object> get props => [message];
}
