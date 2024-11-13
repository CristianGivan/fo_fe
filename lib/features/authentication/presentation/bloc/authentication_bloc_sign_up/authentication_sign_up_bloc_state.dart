part of 'authentication_sign_up.dart';

abstract class AuthenticationSignUpBlocState extends Equatable {
  const AuthenticationSignUpBlocState();

  @override
  List<Object> get props => [];
}

class AuthenticationSignUpInitial extends AuthenticationSignUpBlocState {}

class AuthenticationSignUpLoading extends AuthenticationSignUpBlocState {}

class AuthenticationSignUpSuccess extends AuthenticationSignUpBlocState {
  final AuthenticationEntity authEntity;

  const AuthenticationSignUpSuccess({required this.authEntity});

  @override
  List<Object> get props => [authEntity];
}

class AuthenticationSignUpError extends AuthenticationSignUpBlocState {
  final String message;

  const AuthenticationSignUpError(this.message);

  @override
  List<Object> get props => [message];
}

class EmailValidationState extends AuthenticationSignUpBlocState {
  final bool isValid;

  const EmailValidationState({required this.isValid});

  @override
  List<Object> get props => [isValid];
}

class PasswordValidationState extends AuthenticationSignUpBlocState {
  final bool containsUpperCase;
  final bool containsLowerCase;
  final bool containsNumber;
  final bool containsSpecialChar;
  final bool contains8Length;

  const PasswordValidationState({
    required this.containsUpperCase,
    required this.containsLowerCase,
    required this.containsNumber,
    required this.containsSpecialChar,
    required this.contains8Length,
  });

  @override
  List<Object> get props =>
      [containsUpperCase, containsLowerCase, containsNumber, containsSpecialChar, contains8Length];

  bool get isValid =>
      containsUpperCase &&
      containsLowerCase &&
      containsNumber &&
      containsSpecialChar &&
      contains8Length;
}

class FormValidationState extends AuthenticationSignUpBlocState {
  final bool isEmailValid;
  final bool isPasswordValid;
  final bool isNameValid;

  const FormValidationState({
    required this.isEmailValid,
    required this.isPasswordValid,
    required this.isNameValid,
  });

  @override
  List<Object> get props => [isEmailValid, isPasswordValid, isNameValid];

  bool get isFormValid => isEmailValid && isPasswordValid && isNameValid;
}
