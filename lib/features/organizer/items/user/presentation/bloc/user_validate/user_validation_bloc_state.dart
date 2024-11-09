part of 'user_validation_bloc.dart';

abstract class UserValidationBlocState extends Equatable {
  const UserValidationBlocState();

  @override
  List<Object> get props => [];
}

class UserValidationInitialBlocState extends UserValidationBlocState {}

class EmailValidationBlocState extends UserValidationBlocState {
  final bool isValid;

  const EmailValidationBlocState({required this.isValid});

  @override
  List<Object> get props => [isValid];
}

class PasswordValidationBlocState extends UserValidationBlocState {
  final bool containsUpperCase;
  final bool containsLowerCase;
  final bool containsNumber;
  final bool containsSpecialChar;
  final bool containsLength;

  const PasswordValidationBlocState({
    required this.containsUpperCase,
    required this.containsLowerCase,
    required this.containsNumber,
    required this.containsSpecialChar,
    required this.containsLength,
  });

  @override
  List<Object> get props => [
        containsUpperCase,
        containsLowerCase,
        containsNumber,
        containsSpecialChar,
        containsLength,
      ];

  bool get isValid =>
      containsUpperCase &&
      containsLowerCase &&
      containsNumber &&
      containsSpecialChar &&
      containsLength;
}

class NameValidationBlocState extends UserValidationBlocState {
  final bool isValid;

  const NameValidationBlocState({required this.isValid});

  @override
  List<Object> get props => [isValid];
}

class FormValidationBlocState extends UserValidationBlocState {
  final bool isNameValid;
  final bool isEmailValid;
  final bool isPasswordValid;

  const FormValidationBlocState({
    required this.isNameValid,
    required this.isEmailValid,
    required this.isPasswordValid,
  });

  @override
  List<Object> get props => [isEmailValid, isPasswordValid, isNameValid];

  bool get isFormValid => isEmailValid && isPasswordValid && isNameValid;
}
