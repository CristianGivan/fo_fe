import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fo_fe/features/organizer/items/user/utils/other/user_validation.dart';

part 'user_validation_bloc_event.dart';
part 'user_validation_bloc_state.dart';

class UserValidationBloc extends Bloc<UserValidationBlocEvent, UserValidationBlocState> {
  UserValidationBloc() : super(UserValidationInitialBlocState()) {
    on<ValidateEmailBlocEvent>(_onValidateEmail);
    on<ValidatePasswordBlocEvent>(_onValidatePassword);
    on<ValidateNameBlocEvent>(_onValidateName);
    on<ValidateFormBlocEvent>(_onValidateForm);
  }

  void _onValidateEmail(ValidateEmailBlocEvent event, Emitter<UserValidationBlocState> emit) {
    final isValid = UserValidation.isEmailValid(event.email);
    emit(EmailValidationBlocState(isValid: isValid));
  }

  void _onValidatePassword(ValidatePasswordBlocEvent event, Emitter<UserValidationBlocState> emit) {
    final isValid = UserValidation.isPasswordValid(event.password);
    emit(PasswordValidationBlocState(
      containsUpperCase: event.password.contains(RegExp(r'[A-Z]')),
      containsLowerCase: event.password.contains(RegExp(r'[a-z]')),
      containsNumber: event.password.contains(RegExp(r'[0-9]')),
      containsSpecialChar:
          event.password.contains(RegExp(r'[!@#\$&*~`)\%\-(_+=;:,.<>/?"[{\]}\|^]')),
      contains9Length: event.password.length >= 8,
    ));
  }

  void _onValidateName(ValidateNameBlocEvent event, Emitter<UserValidationBlocState> emit) {
    final isValid = UserValidation.isNameValid(event.name);
    emit(NameValidationBlocState(isValid: isValid));
  }

  void _onValidateForm(ValidateFormBlocEvent event, Emitter<UserValidationBlocState> emit) {
    final isEmailValid = UserValidation.isEmailValid(event.email);
    final isPasswordValid = UserValidation.isPasswordValid(event.password);
    final isNameValid = UserValidation.isNameValid(event.name);
    emit(FormValidationBlocState(
      isEmailValid: isEmailValid,
      isPasswordValid: isPasswordValid,
      isNameValid: isNameValid,
    ));
  }
}
