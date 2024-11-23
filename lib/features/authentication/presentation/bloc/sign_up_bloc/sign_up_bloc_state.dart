part of 'sign_up_bloc.dart';

abstract class SignUpBlocState extends Equatable {
  const SignUpBlocState();

  @override
  List<Object> get props => [];
}

class SignUpInitialBlocState extends SignUpBlocState {}

class SignUpLoadingBlocState extends SignUpBlocState {}

class SignUpSuccessBlocState extends SignUpBlocState {
  final AuthEntity authEntity;
  final UserEntity userEntity;

  const SignUpSuccessBlocState({required this.authEntity, required this.userEntity});

  @override
  List<Object> get props => [authEntity, userEntity];
}

class SignUpFailedBlocState extends SignUpBlocState {
  final String error;

  const SignUpFailedBlocState(this.error);

  @override
  List<Object> get props => [error];
}
