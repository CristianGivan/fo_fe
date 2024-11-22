import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fo_fe/core/usecase/params.dart';
import 'package:fo_fe/core/utils/exports/core_utils_exports.dart';
import 'package:fo_fe/features/authentication/utils/auth_exports.dart';
import 'package:fo_fe/features/authentication/utils/other/auth_params.dart';
import 'package:fo_fe/features/organizer/items/user/utils/user_exports.dart';

part 'auth_log_bloc_event.dart';
part 'auth_log_bloc_state.dart';

class AuthLogBloc extends Bloc<AuthLogBlocEvent, AuthSignBlocState> {
  final LogInUseCase logInUseCase;
  final LogInAutoUseCase logInAutoUseCase;
  final LogSwitchUseCase logSwitchUseCase;
  final LogOutUseCase logOutUseCase;

  AuthLogBloc({
    required this.logInUseCase,
    required this.logInAutoUseCase,
    required this.logSwitchUseCase,
    required this.logOutUseCase,
  }) : super(AuthLogInitialBlocState()) {
    on<AuthLogInBlocEvent>(_logInUseCase);
    on<AuthLogSwitchBlocEvent>(_onLogSwitch);
    on<AuthLogInAutoBlocEvent>(_logInAutoUseCase);
    on<AuthLogOutBlocEvent>(_logOutUseCase);
  }

  Future<void> _logInUseCase(AuthLogInBlocEvent event, Emitter<AuthSignBlocState> emit) async {
    emit(AuthLogLoadingBlocState());

    final result = await logInUseCase(UserParams(
      email: event.email,
      password: event.password,
    ));

    emit(result.fold(
      (failure) => AuthLogErrorBlocState(_mapFailureToMessage(failure)),
      (authEntity) => AuthLogInSuccessBlocState(authEntity: authEntity),
    ));
  }

  Future<void> _logInAutoUseCase(
      AuthLogInAutoBlocEvent event, Emitter<AuthSignBlocState> emit) async {
    emit(AuthLogLoadingBlocState());
    final result = await logInAutoUseCase(NoParams());
    emit(result.fold(
      (failure) => AuthLogErrorBlocState(_mapFailureToMessage(failure)),
      (authEntity) {
        if (authEntity.isEmpty()) {
          return const AuthLogFailedBlocState('Token Expired');
        } else {
          return AuthLogInAutoSuccessBlocState(authEntity: authEntity);
        }
      },
    ));
  }

  Future<void> _onLogSwitch(AuthLogSwitchBlocEvent event, Emitter<AuthSignBlocState> emit) async {
    emit(AuthLogLoadingBlocState());

    final result = await logSwitchUseCase(AuthParams(userId: event.userId));
    emit(result.fold(
      (failure) => AuthLogErrorBlocState(_mapFailureToMessage(failure)),
      (authEntity) => AuthLogInAutoSuccessBlocState(authEntity: authEntity),
    ));
  }

  Future<void> _logOutUseCase(AuthLogOutBlocEvent event, Emitter<AuthSignBlocState> emit) async {
    emit(AuthLogLoadingBlocState());

    final result = await logOutUseCase(AuthParams(authId: event.authId));
    emit(result.fold(
      (failure) => AuthLogErrorBlocState(_mapFailureToMessage(failure)),
      (success) => AuthLogOutSuccessBlocState(),
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
