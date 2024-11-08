part of 'user_validation_bloc.dart';

abstract class UserValidationBlocEvent extends Equatable {
  const UserValidationBlocEvent();

  @override
  List<Object> get props => [];
}

class ValidateEmailBlocEvent extends UserValidationBlocEvent {
  final String email;

  const ValidateEmailBlocEvent(this.email);

  @override
  List<Object> get props => [email];
}

class ValidatePasswordBlocEvent extends UserValidationBlocEvent {
  final String password;

  const ValidatePasswordBlocEvent(this.password);

  @override
  List<Object> get props => [password];
}

class ValidateNameBlocEvent extends UserValidationBlocEvent {
  final String name;

  const ValidateNameBlocEvent(this.name);

  @override
  List<Object> get props => [name];
}

class ValidateFormBlocEvent extends UserValidationBlocEvent {
  final String email;
  final String password;
  final String name;

  const ValidateFormBlocEvent({
    required this.email,
    required this.password,
    required this.name,
  });

  @override
  List<Object> get props => [email, password, name];
}