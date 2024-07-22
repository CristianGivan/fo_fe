part of 'authentication_bloc_sign_in.dart';

abstract class AuthenticationBlocSignInState extends Equatable {
  const AuthenticationBlocSignInState();

  @override
  List<Object> get props => [];
}

class AuthenticationSignInInitial extends AuthenticationBlocSignInState {}

class AuthenticationSignInLoading extends AuthenticationBlocSignInState {}

class AuthenticationSignInAuthenticated extends AuthenticationBlocSignInState {
  final AuthenticationEntity authEntity;

  const AuthenticationSignInAuthenticated({required this.authEntity});

  @override
  List<Object> get props => [authEntity];
}

class AuthenticationSignInError extends AuthenticationBlocSignInState {
  final String message;

  const AuthenticationSignInError(this.message);

  @override
  List<Object> get props => [message];
}
