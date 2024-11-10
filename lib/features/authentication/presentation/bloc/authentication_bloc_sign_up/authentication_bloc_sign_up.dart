import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fo_fe/features/authentication/utils/authentication_exports.dart';
import 'package:fo_fe/features/organizer/items/user/utils/other/user_validation.dart';
import 'package:fo_fe/features/organizer/items/user/utils/user_exports.dart';

import '../../../../../core/error/failures.dart';

part 'authentication_bloc_sign_up_event.dart';
part 'authentication_bloc_sign_up_state.dart';

class AuthenticationBlocSignUp
    extends Bloc<AuthenticationBlocSignUpEvent, AuthenticationBlocSignUpState> {
  final SignUpUseCase signUpUseCase;
  final UserValidationBloc userValidationBloc;

  AuthenticationBlocSignUp({required this.signUpUseCase, required this.userValidationBloc})
      : super(AuthenticationSignUpInitial()) {
    on<EmailChanged>(_onEmailChanged);
    on<PasswordChanged>(_onPasswordChanged);
    on<NameChanged>(_onNameChanged);
    on<ValidateForm>(_onValidateForm);
    on<SignUpBlocEvent>(_onSignUp);
  }

  bool _isEmailValid = false;
  bool _isPasswordValid = false;
  bool _isNameValid = false;

  void _onEmailChanged(EmailChanged event, Emitter<AuthenticationBlocSignUpState> emit) {
    userValidationBloc.add(ValidateEmailBlocEvent(event.email));
    _isEmailValid = UserValidation.isEmailValid(event.email);
    emit(EmailValidationState(isValid: _isEmailValid));
    add(ValidateForm());
  }

  void _onPasswordChanged(PasswordChanged event, Emitter<AuthenticationBlocSignUpState> emit) {
    userValidationBloc.add(ValidatePasswordBlocEvent(event.password));
    _isPasswordValid = UserValidation.isPasswordValid(event.password);
    emit(PasswordValidationState(
      containsUpperCase: UserValidation.containsUpperCase(event.password),
      containsLowerCase: UserValidation.containsLowerCase(event.password),
      containsNumber: UserValidation.containsNumber(event.password),
      containsSpecialChar: UserValidation.containsSpecialChar(event.password),
      //todo -fix- should be imported from user
      contains8Length: event.password.length >= 9,
    ));
    add(ValidateForm());
  }

  void _onNameChanged(NameChanged event, Emitter<AuthenticationBlocSignUpState> emit) {
    userValidationBloc.add(ValidateNameBlocEvent(event.name));
    _isNameValid = UserValidation.isNameValid(event.name);
    add(ValidateForm());
  }

  void _onValidateForm(ValidateForm event, Emitter<AuthenticationBlocSignUpState> emit) {
    emit(FormValidationState(
      isEmailValid: _isEmailValid,
      isPasswordValid: _isPasswordValid,
      isNameValid: _isNameValid,
    ));
  }

  Future<void> _onSignUp(SignUpBlocEvent event, Emitter<AuthenticationBlocSignUpState> emit) async {
    emit(AuthenticationSignUpLoading());

    final result = await signUpUseCase(SignUpParams(
      name: event.name,
      email: event.email,
      password: event.password,
    ));
    emit(result.fold(
      (failure) => AuthenticationSignUpError(_mapFailureToMessage(failure)),
      (authEntity) => AuthenticationSignUpSuccess(authEntity: authEntity),
    ));
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case NetworkFailure:
        return 'Network error occurred';
      case ServerFailure:
        return 'Server error occurred';
      case CacheFailure:
        return 'Cache error occurred';
      default:
        return 'An error occurred: ${failure.message}';
    }
  }
}
