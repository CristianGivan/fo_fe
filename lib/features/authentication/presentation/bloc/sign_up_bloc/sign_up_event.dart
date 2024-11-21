part of 'sign_up_bloc.dart';

abstract class SignUpEvent extends Equatable {
  const SignUpEvent();

  @override
  List<Object> get props => [];
}

class SignUpBlocEvent extends SignUpEvent {
  final UserEntity user;
  final bool isAutoSignIn;

  const SignUpBlocEvent({required this.user, required this.isAutoSignIn});

  @override
  List<Object> get props => [user, isAutoSignIn];
}
