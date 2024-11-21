import 'package:fo_fe/core/utils/exports/core_utils_exports.dart';
import 'package:fo_fe/core/utils/exports/external_exports.dart';
import 'package:fo_fe/features/authentication/utils/auth_exports.dart';
import 'package:fo_fe/features/authentication/utils/other/auth_params.dart';

part 'sign_out_event.dart';
part 'sign_out_state.dart';

class SignOutBloc extends Bloc<SignOutBlocEvent, SignOutState> {
  final SignOutUseCase signOutUseCase;

  SignOutBloc({required this.signOutUseCase}) : super(SignOutInitialBlocState()) {
    on<SignOutBlocEvent>(_signOutUseCase);
  }

  Future<void> _signOutUseCase(SignOutBlocEvent event, Emitter<SignOutState> emit) async {
    emit(SignOutLoadingBlocState());

    final result = await signOutUseCase(AuthParams(authId: event.authId));
    emit(result.fold(
      (failure) => SignOutFailedBlocState(_mapFailureToMessage(failure)),
      (success) => SignOutSuccessBlocState(),
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
