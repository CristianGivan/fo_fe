import 'package:fo_fe/core/usecase/params.dart';
import 'package:fo_fe/core/utils/exports/core_utils_exports.dart';
import 'package:fo_fe/core/utils/exports/external_exports.dart';
import 'package:fo_fe/features/authentication/utils/auth_exports.dart';

part 'auth_user_event.dart';
part 'auth_user_state.dart';

class AuthUserBloc extends Bloc<AuthGetSignInUserBlocEvent, AuthUserState> {
  final GetSignInUserUseCase getSignInUserUseCase;

  AuthUserBloc({required this.getSignInUserUseCase}) : super(AuthUserIdInitialState()) {
    on<AuthGetSignInUserBlocEvent>(_onGetLoggedInUserId);
  }

  Future<void> _onGetLoggedInUserId(
      AuthGetSignInUserBlocEvent event, Emitter<AuthUserState> emit) async {
    emit(AuthUserIdLoadingState());

    final result = await getSignInUserUseCase(NoParams());
    emit(result.fold(
      (failure) => AuthUserIdFailedState(_mapFailureToMessage(failure)),
      (userId) => AuthUserIdLoadedState(userId: userId),
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
