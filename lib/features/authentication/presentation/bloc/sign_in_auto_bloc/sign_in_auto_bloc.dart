import 'package:fo_fe/core/error/failures.dart';
import 'package:fo_fe/core/usecase/params.dart';
import 'package:fo_fe/core/utils/exports/external_exports.dart';
import 'package:fo_fe/features/authentication/utils/auth_exports.dart';

part 'sign_in_auto_event.dart';
part 'sign_in_auto_state.dart';

class SignInAutoBloc extends Bloc<SignInAutoEvent, SignInAutoState> {
  final SignInAutoUseCase signInAutoUseCase;

  SignInAutoBloc({required this.signInAutoUseCase}) : super(SignInAutoInitialState()) {
    on<SignInAutoBlocEvent>(_signInAutoUseCase);
  }

  Future<void> _signInAutoUseCase(SignInAutoBlocEvent event, Emitter<SignInAutoState> emit) async {
    emit(SignInAutoLoadingState());
    final result = await signInAutoUseCase(NoParams());
    emit(result.fold(
      (failure) => SignInAutoFailedBlocState(_mapFailureToMessage(failure)),
      (authEntity) {
        if (authEntity.isEmpty()) {
          return const SignInAutoFailedBlocState('Token Expired');
        } else {
          return SignInAutoSuccessBlocState(authEntity: authEntity);
        }
      },
    ));
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case NetworkFailure _:
        return 'Network error occurred';
      case ServerFailure _:
        return 'Server error occurred';
      case AuthFailure _:
        return 'Auth failed';
      default:
        return 'An error occurred: ${failure.message}';
    }
  }
}
