part of 'sign_out_bloc.dart';

abstract class SignOutState extends Equatable {
  const SignOutState();

  @override
  List<Object> get props => [];
}

class SignOutInitialBlocState extends SignOutState {}

class SignOutLoadingBlocState extends SignOutState {}

class SignOutSuccessBlocState extends SignOutState {}

class SignOutFailedBlocState extends SignOutState {
  final String error;

  const SignOutFailedBlocState(this.error);

  @override
  List<Object> get props => [error];
}
