part of 'sign_up_bloc.dart';

abstract class SignUpBlocEvent extends Equatable {
  const SignUpBlocEvent();

  @override
  List<Object> get props => [];
}

class SignUpRequestBlocEvent extends SignUpBlocEvent {
  final UserEntity user;
  final bool isAutoSignIn;

  const SignUpRequestBlocEvent({required this.user, required this.isAutoSignIn});

  @override
  List<Object> get props => [user, isAutoSignIn];
}
