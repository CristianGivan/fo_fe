part of 'sign_in_auto_bloc.dart';

abstract class SignInAutoState extends Equatable {
  const SignInAutoState();

  @override
  List<Object> get props => [];
}

class SignInAutoInitialState extends SignInAutoState {}

class SignInAutoLoadingState extends SignInAutoState {}

class SignInAutoSuccessBlocState extends SignInAutoState {
  final AuthEntity authEntity;

  const SignInAutoSuccessBlocState({required this.authEntity});

  @override
  List<Object> get props => [authEntity];
}

class SignInAutoFailedBlocState extends SignInAutoState {
  final String error;

  const SignInAutoFailedBlocState(this.error);

  @override
  List<Object> get props => [error];
}
