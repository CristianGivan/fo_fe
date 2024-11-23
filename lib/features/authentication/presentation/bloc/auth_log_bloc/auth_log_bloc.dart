import 'package:fo_fe/core/usecase/params.dart';
import 'package:fo_fe/core/utils/exports/core_utils_exports.dart';
import 'package:fo_fe/core/utils/exports/external_exports.dart';
import 'package:fo_fe/features/authentication/utils/auth_exports.dart';
import 'package:fo_fe/features/authentication/utils/other/auth_params.dart';
import 'package:fo_fe/features/organizer/items/user/domain/usecases/user_usecase_export.dart';
import 'package:fo_fe/features/organizer/items/user/utils/user_exports.dart';

part 'auth_log_bloc_event.dart';
part 'auth_log_bloc_state.dart';

class AuthLogBloc extends Bloc<AuthLogBlocEvent, AuthSignBlocState> {
  final LogInUseCase logInUseCase;
  final LogInAutoUseCase logInAutoUseCase;
  final LogSwitchUseCase logSwitchUseCase;
  final LogOutUseCase logOutUseCase;
  final GetUserByIdUseCase getUserByIdUseCase;

  AuthLogBloc({
    required this.logInUseCase,
    required this.logInAutoUseCase,
    required this.logSwitchUseCase,
    required this.logOutUseCase,
    required this.getUserByIdUseCase,
  }) : super(AuthLogInitialBlocState()) {
    on<AuthLogInBlocEvent>(_logInUseCase);
    on<AuthLogInAutoBlocEvent>(_logInAutoUseCase);
    on<AuthLogOutBlocEvent>(_logOutUseCase);
  }

  Future<void> _logInUseCase(AuthLogInBlocEvent event, Emitter<AuthSignBlocState> emit) async {
    emit(const AuthLogLoadingBlocState(AuthOperation.logIn));

    final result = await logInUseCase(UserParams(
      email: event.email,
      password: event.password,
    ));

    await result.fold(
      (failure) async => emit(AuthLogErrorBlocState(_mapFailureToMessage(failure))),
      (authEntity) async =>
          await _fetchUserAndEmitAuthenticatedState(authEntity, AuthOperation.logIn, emit),
    );
  }

  Future<void> _logInAutoUseCase(
      AuthLogInAutoBlocEvent event, Emitter<AuthSignBlocState> emit) async {
    emit(const AuthLogLoadingBlocState(AuthOperation.logInAuto));
    final result = await logInAutoUseCase(NoParams());
    await result.fold(
      (failure) async => emit(AuthLogErrorBlocState(_mapFailureToMessage(failure))),
      (authEntity) async {
        if (authEntity.isEmpty()) {
          emit(const AuthLogErrorBlocState('Token Expired'));
        } else {
          await _fetchUserAndEmitAuthenticatedState(authEntity, AuthOperation.logInAuto, emit);
        }
      },
    );
  }

  Future<void> _logOutUseCase(AuthLogOutBlocEvent event, Emitter<AuthSignBlocState> emit) async {
    emit(const AuthLogLoadingBlocState(AuthOperation.logOut));
    final result = await logOutUseCase(AuthParams(authId: event.authId));
    emit(result.fold(
      (failure) => AuthLogErrorBlocState(_mapFailureToMessage(failure)),
      (_) => AuthLogOutSuccessBlocState(),
    ));
  }

  Future<void> _fetchUserAndEmitAuthenticatedState(
    AuthEntity authEntity,
    AuthOperation operationType,
    Emitter<AuthSignBlocState> emit,
  ) async {
    final userResult = await getUserByIdUseCase(UserParams(userId: authEntity.userId));
    userResult.fold(
      (failure) => emit(AuthLogErrorBlocState(_mapFailureToMessage(failure))),
      (userEntity) => emit(AuthAuthenticatedBlocState(
        authEntity: authEntity,
        userEntity: userEntity,
        operationType: operationType,
      )),
    );
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
        return 'An error occurred: \n ${failure.message}';
    }
  }
}
