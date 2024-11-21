import 'package:fo_fe/core/utils/exports/core_utils_exports.dart';
import 'package:fo_fe/core/utils/exports/external_exports.dart';
import 'package:fo_fe/features/authentication/utils/auth_exports.dart';
import 'package:fo_fe/features/organizer/items/user/utils/user_exports.dart';

part 'sign_in_event.dart';
part 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  final SigInUseCase sigInUseCase;

  SignInBloc({required this.sigInUseCase}) : super(SignInInitialBlocState()) {
    on<SignInBlocEvent>(_sigInUseCase);
  }

  Future<void> _sigInUseCase(SignInBlocEvent event, Emitter<SignInState> emit) async {
    emit(SignInLoadingBlocState());

    final result = await sigInUseCase(UserParams(
      email: event.email,
      password: event.password,
    ));

    emit(result.fold(
      (failure) => SignInFailedBlocState(_mapFailureToMessage(failure)),
      (authEntity) => SignInSuccessBlocState(authEntity: authEntity),
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
