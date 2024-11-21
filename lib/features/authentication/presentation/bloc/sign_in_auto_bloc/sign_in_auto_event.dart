part of 'sign_in_auto_bloc.dart';

abstract class SignInAutoEvent extends Equatable {
  const SignInAutoEvent();

  @override
  List<Object> get props => [];
}

class SignInAutoBlocEvent extends SignInAutoEvent {}
