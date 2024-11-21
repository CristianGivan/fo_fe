part of 'sign_out_bloc.dart';

abstract class SignOutEvent extends Equatable {
  const SignOutEvent();

  @override
  List<Object> get props => [];
}

class SignOutBlocEvent extends SignOutEvent {
  final int authId;

  const SignOutBlocEvent({required this.authId});

  @override
  List<Object> get props => [authId];
}
