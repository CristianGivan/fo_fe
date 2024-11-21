part of '../sign_in_bloc/sign_in_bloc.dart';

abstract class SignInState extends Equatable {
  const SignInState();

  @override
  List<Object> get props => [];
}

class SignInInitialBlocState extends SignInState {}

class SignInLoadingBlocState extends SignInState {}

class SignInSuccessBlocState extends SignInState {
  final AuthEntity authEntity;

  const SignInSuccessBlocState({required this.authEntity});

  @override
  List<Object> get props => [authEntity];
}

class SignInFailedBlocState extends SignInState {
  final String error;

  const SignInFailedBlocState(this.error);

  @override
  List<Object> get props => [error];
}
