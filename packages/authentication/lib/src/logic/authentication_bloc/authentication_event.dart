part of authentication;

sealed class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();


  @override
  List<Object> get props => [];
}

class AuthenticationUserChanged extends AuthenticationEvent {
  final MyUser? user;

  const AuthenticationUserChanged(this.user);
}
