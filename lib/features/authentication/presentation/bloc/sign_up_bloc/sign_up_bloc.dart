import 'package:fo_fe/core/utils/exports/core_utils_exports.dart';
import 'package:fo_fe/core/utils/exports/external_exports.dart';
import 'package:fo_fe/features/authentication/utils/auth_exports.dart';
import 'package:fo_fe/features/authentication/utils/other/auth_params.dart';
import 'package:fo_fe/features/organizer/all_items/user/utils/user_exports.dart';

part 'sign_up_bloc_event.dart';
part 'sign_up_bloc_state.dart';

class SignUpBloc extends Bloc<SignUpRequestBlocEvent, SignUpBlocState> {
  final SignUpUseCase signUpUseCase;

  SignUpBloc({required this.signUpUseCase}) : super(SignUpInitialBlocState()) {
    on<SignUpRequestBlocEvent>(_signUpUseCase);
  }

  Future<void> _signUpUseCase(SignUpRequestBlocEvent event, Emitter<SignUpBlocState> emit) async {
    emit(SignUpLoadingBlocState());
    final result = await signUpUseCase(SignUpParams(
      user: event.user,
      isAutoSignIn: event.isAutoSignIn,
    ));
    emit(result.fold(
      (failure) => SignUpFailedBlocState(_mapFailureToMessage(failure)),
      (authEntity) => SignUpSuccessBlocState(
          authEntity: authEntity, userEntity: event.user.copyWith(id: authEntity.userId)),
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
        return 'An error occurred:\n ${failure.message}';
    }
  }
}
