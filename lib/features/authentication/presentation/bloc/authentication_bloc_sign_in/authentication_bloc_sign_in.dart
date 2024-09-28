import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fo_fe/core/error/failures.dart';
import 'package:fo_fe/features/authentication/utils/authentication_exports.dart';

part 'authentication_bloc_sign_in_event.dart';
part 'authentication_bloc_sign_in_state.dart';

class AuthenticationBlocSignIn
    extends Bloc<AuthenticationBlocSignInEvent, AuthenticationBlocSignInState> {
  final LoginUseCase loginUseCase;

  AuthenticationBlocSignIn({
    required this.loginUseCase,
  }) : super(AuthenticationSignInInitial()) {
    on<LoginEvent>(_onLogin);
  }

  Future<void> _onLogin(
      LoginEvent event, Emitter<AuthenticationBlocSignInState> emit) async {
    emit(AuthenticationSignInLoading());

    final result = await loginUseCase(LoginParams(
      email: event.email,
      password: event.password,
    ));

    emit(result.fold(
      (failure) => AuthenticationSignInError(_mapFailureToMessage(failure)),
      (authEntity) => AuthenticationSignInAuthenticated(authEntity: authEntity),
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
