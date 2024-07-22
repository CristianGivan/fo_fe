import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fo_fe/core/error/failures.dart';
import 'package:fo_fe/features/authentication/authentication_exports.dart';
import 'package:fo_fe/features/authentication/domain/usecases/sign_up.dart';

part 'authentication_bloc_sign_up_event.dart';
part 'authentication_bloc_sign_up_state.dart';

class AuthenticationBlocSignUp
    extends Bloc<AuthenticationBlocSignUpEvent, AuthenticationBlocSignUpState> {
  final SignUpUseCase signUpUseCase;

  AuthenticationBlocSignUp({required this.signUpUseCase})
      : super(AuthenticationSignUpInitial()) {
    on<SignUpBlocEvent>(_onSignUp);
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
