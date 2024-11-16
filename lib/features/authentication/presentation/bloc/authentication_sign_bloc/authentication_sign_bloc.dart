import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fo_fe/core/error/failures.dart';
import 'package:fo_fe/core/usecase/params.dart';
import 'package:fo_fe/core/utils/exports/core_utils_exports.dart';
import 'package:fo_fe/features/authentication/utils/authentication_exports.dart';
import 'package:fo_fe/features/authentication/utils/other/auth_params.dart';
import 'package:fo_fe/features/organizer/items/user/utils/user_exports.dart';

part 'authenticationSign_bloc_event.dart';
part 'authentication_sign_bloc_state.dart';

class AuthenticationSignBloc
    extends Bloc<AuthenticationSignBlocEvent, AuthenticationSignBlocState> {
  final SignUpUseCase signUpUseCase;
  final SigInUseCase sigInUseCase;
  final SignInAutoUseCase signInAutoUseCase;
  final SignOutUseCase signOutUseCase;
  final SwitchUserUseCase switchUserUseCase;
  final GetSignInUserIdUseCase getLoggedInUserIdUseCase;

  AuthenticationSignBloc({
    required this.signUpUseCase,
    required this.sigInUseCase,
    required this.signInAutoUseCase,
    required this.signOutUseCase,
    required this.getLoggedInUserIdUseCase,
    required this.switchUserUseCase,
  }) : super(AuthSignInitialBlocState()) {
    on<AuthSignUpBlocEvent>(_signUpUseCase);
    on<AuthSignInBlocEvent>(_sigInUseCase);
    on<AuthSignInAutoBlocEvent>(_signInAutoUseCase);
    on<AuthSignOutBlocEvent>(_signOutUseCase);
    on<AuthSwitchUserBlocEvent>(_onSwitchUser);
    on<AuthGetSignInUserIdBlocEvent>(_onGetLoggedInUserId);
  }

  Future<void> _signUpUseCase(
      AuthSignUpBlocEvent event, Emitter<AuthenticationSignBlocState> emit) async {
    emit(AuthSignLoadingBlocState());
    final result = await signUpUseCase(UserParams(user: event.user));
    emit(result.fold(
      (failure) => AuthSignErrorBlocState(_mapFailureToMessage(failure)),
      (authEntity) => AuthSignUpSuccessBlocState(authEntity: authEntity),
    ));
  }

  Future<void> _sigInUseCase(
      AuthSignInBlocEvent event, Emitter<AuthenticationSignBlocState> emit) async {
    emit(AuthSignLoadingBlocState());

    final result = await sigInUseCase(UserParams(
      email: event.email,
      password: event.password,
    ));

    emit(result.fold(
      (failure) => AuthSignErrorBlocState(_mapFailureToMessage(failure)),
      (authEntity) => AuthSignInSuccessBlocState(authEntity: authEntity),
    ));
  }

  Future<void> _signInAutoUseCase(
      AuthSignInAutoBlocEvent event, Emitter<AuthenticationSignBlocState> emit) async {
    emit(AuthSignLoadingBlocState());
    final result = await signInAutoUseCase(NoParams());
    emit(result.fold(
      (failure) => AuthSignErrorBlocState(_mapFailureToMessage(failure)),
      (authEntity) {
        if (authEntity.isEmpty()) {
          return const AuthSignFailedBlocState('Token Expired');
        } else {
          return AuthSignInAutoSuccessBlocState(authEntity: authEntity);
        }
      },
    ));
  }

  Future<void> _signOutUseCase(
      AuthSignOutBlocEvent event, Emitter<AuthenticationSignBlocState> emit) async {
    emit(AuthSignLoadingBlocState());

    final result = await signOutUseCase(AuthParams(authId: event.authId));
    emit(result.fold(
      (failure) => AuthSignErrorBlocState(_mapFailureToMessage(failure)),
      (success) => AuthSignOutSuccessBlocState(),
    ));
  }

  Future<void> _onGetLoggedInUserId(
      AuthGetSignInUserIdBlocEvent event, Emitter<AuthenticationSignBlocState> emit) async {
    emit(AuthSignLoadingBlocState());

    final result = await getLoggedInUserIdUseCase(NoParams());
    emit(result.fold(
      (failure) => AuthSignErrorBlocState(_mapFailureToMessage(failure)),
      (userId) => AuthUserIdLoadedBlocState(userId: userId),
    ));
  }

  Future<void> _onSwitchUser(
      AuthSwitchUserBlocEvent event, Emitter<AuthenticationSignBlocState> emit) async {
    emit(AuthSignLoadingBlocState());

    final result = await switchUserUseCase(AuthParams(userId: event.userId));
    emit(result.fold(
      (failure) => AuthSignErrorBlocState(_mapFailureToMessage(failure)),
      (authEntity) => AuthSignInAutoSuccessBlocState(authEntity: authEntity),
    ));
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case NetworkFailure _:
        return 'Network error occurred';
      case ServerFailure _:
        return 'Server error occurred';
      case AuthenticationFailure _:
        return 'Authentication failed';
      default:
        return 'An error occurred: ${failure.message}';
    }
  }
}
