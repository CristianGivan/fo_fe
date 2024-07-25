import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fo_fe/core/const/regexp.dart';
import 'package:fo_fe/core/error/failures.dart';
import 'package:fo_fe/features/authentication/config/authentication_exports.dart';

part 'authentication_bloc_sign_up_event.dart';
part 'authentication_bloc_sign_up_state.dart';

class AuthenticationBlocSignUp
    extends Bloc<AuthenticationBlocSignUpEvent, AuthenticationBlocSignUpState> {
  final SignUpUseCase signUpUseCase;

  AuthenticationBlocSignUp({required this.signUpUseCase})
      : super(AuthenticationSignUpInitial()) {
    on<EmailChanged>(_onEmailChanged);
    on<PasswordChanged>(_onPasswordChanged);
    on<NameChanged>(_onNameChanged);
    on<ValidateForm>(_onValidateForm);
    on<SignUpBlocEvent>(_onSignUp);
  }

  String _email = '';
  String _password = '';
  String _name = '';
  bool _isEmailValid = false;
  bool _isPasswordValid = false;
  bool _isNameValid = false;

  void _onEmailChanged(
      EmailChanged event, Emitter<AuthenticationBlocSignUpState> emit) {
    _email = event.email;
    _isEmailValid = emailRexExp.hasMatch(event.email);
    emit(EmailValidationState(isValid: _isEmailValid));
    add(ValidateForm());
  }

  void _onPasswordChanged(
      PasswordChanged event, Emitter<AuthenticationBlocSignUpState> emit) {
    _password = event.password;
    bool containsUpperCase = event.password.contains(RegExp(r'[A-Z]'));
    bool containsLowerCase = event.password.contains(RegExp(r'[a-z]'));
    bool containsNumber = event.password.contains(RegExp(r'[0-9]'));
    bool containsSpecialChar = event.password.contains(specialCharRexExp);
    bool contains8Length = event.password.length >= 8;

    _isPasswordValid = containsUpperCase &&
        containsLowerCase &&
        containsNumber &&
        containsSpecialChar &&
        contains8Length;

    emit(PasswordValidationState(
      containsUpperCase: containsUpperCase,
      containsLowerCase: containsLowerCase,
      containsNumber: containsNumber,
      containsSpecialChar: containsSpecialChar,
      contains8Length: contains8Length,
    ));
    add(ValidateForm());
  }

  void _onNameChanged(
      NameChanged event, Emitter<AuthenticationBlocSignUpState> emit) {
    _name = event.name;
    _isNameValid = event.name.isNotEmpty && event.name.length <= 30;
    add(ValidateForm());
  }

  void _onValidateForm(
      ValidateForm event, Emitter<AuthenticationBlocSignUpState> emit) {
    emit(FormValidationState(
      isEmailValid: _isEmailValid,
      isPasswordValid: _isPasswordValid,
      isNameValid: _isNameValid,
    ));
  }

  Future<void> _onSignUp(SignUpBlocEvent event,
      Emitter<AuthenticationBlocSignUpState> emit) async {
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
      case AuthenticationFailure:
        return 'Authentication failed';
      default:
        return 'Unexpected error occurred';
    }
  }
}
