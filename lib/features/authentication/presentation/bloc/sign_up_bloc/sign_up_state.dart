part of 'sign_up_bloc.dart';
abstract class SignUpState extends Equatable {
  const SignUpState();

  @override
  List<Object> get props => [];
}

class SignUpInitialBlocState extends SignUpState {}

class SignUpLoadingBlocState extends SignUpState {}

class SignUpSuccessBlocState extends SignUpState {
  final AuthEntity authEntity;

  const SignUpSuccessBlocState({required this.authEntity});

  @override
  List<Object> get props => [authEntity];
}

class SignUpFailedBlocState extends SignUpState {
  final String error;

  const SignUpFailedBlocState(this.error);

  @override
  List<Object> get props => [error];
}
