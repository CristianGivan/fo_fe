part of 'authentication_bloc.dart';

class AuthenticationBlocAuthentication
    extends Bloc<AuthenticationBlocEvent, AuthenticationBlocState> {
  final AutoLoginUseCase autoLoginUseCase;
  final GetLoggedInUserIdUseCase getLoggedInUserIdUseCase;
  final LoginUseCase loginUseCase;
  final LogoutUseCase logoutUseCase;
  final RefreshTokenUseCase refreshTokenUseCase;
  final SwitchUserUseCase switchUserUseCase;
  final SignUpUseCase signUpUseCase;

  AuthenticationBlocAuthentication({
    required this.autoLoginUseCase,
    required this.getLoggedInUserIdUseCase,
    required this.loginUseCase,
    required this.logoutUseCase,
    required this.refreshTokenUseCase,
    required this.switchUserUseCase,
    required this.signUpUseCase,
  }) : super(AuthenticationInitialBlocState()) {
    on<AutoLoginBlocEvent>(_onAutoLogin);
    on<GetLoggedInUserIdBlocEvent>(_onGetLoggedInUserId);
    on<SignUpBlocEvent>(_onLogin);
    on<LogoutBlocEvent>(_onLogout);
    on<RefreshTokenBlocEvent>(_onRefreshToken);
    on<SwitchUserBlocEvent>(_onSwitchUser);
    on<SignUpBlocEvent>(_onSignUp);
  }

  Future<void> _onSignUp(
    SignUpBlocEvent event,
    Emitter<AuthenticationBlocState> emit,
  ) async {
    emit(AuthenticationLoadingBlocState());

    final result = await signUpUseCase(SignUpParams(
      name: event.name,
      email: event.email,
      password: event.password,
    ));

    result.fold(
      (failure) =>
          emit(AuthenticationErrorBlocState(_mapFailureToMessage(failure))),
      (authEntity) =>
          emit(AuthenticationAuthenticatedBlocState(authEntity: authEntity)),
    );
  }

  Future<void> _onAutoLogin(
      AutoLoginBlocEvent event, Emitter<AuthenticationBlocState> emit) async {
    emit(AuthenticationLoadingBlocState());
    final result = await autoLoginUseCase(NoParams());
    emit(result.fold(
      (failure) {
        if (failure is NoActiveSessionFailure) {
          return AuthenticationUnauthenticatedBlocState();
        }
        return AuthenticationErrorBlocState(_mapFailureToMessage(failure));
      },
      (authEntity) =>
          AuthenticationAuthenticatedBlocState(authEntity: authEntity),
    ));
  }

  Future<void> _onGetLoggedInUserId(GetLoggedInUserIdBlocEvent event,
      Emitter<AuthenticationBlocState> emit) async {
    emit(AuthenticationLoadingBlocState());
    final result = await getLoggedInUserIdUseCase(NoParams());
    emit(result.fold(
      (failure) => AuthenticationErrorBlocState(_mapFailureToMessage(failure)),
      (userId) => AuthenticationUserIdLoadedBlocState(userId: userId),
    ));
  }

  Future<void> _onLogin(
      SignUpBlocEvent event, Emitter<AuthenticationBlocState> emit) async {
    emit(AuthenticationLoadingBlocState());
    final result = await loginUseCase(
        LoginParams(email: event.email, password: event.password));
    emit(result.fold(
      (failure) => AuthenticationErrorBlocState(_mapFailureToMessage(failure)),
      (authEntity) =>
          AuthenticationAuthenticatedBlocState(authEntity: authEntity),
    ));
  }

  Future<void> _onLogout(
      LogoutBlocEvent event, Emitter<AuthenticationBlocState> emit) async {
    emit(AuthenticationLoadingBlocState());
    final result = await logoutUseCase(LogoutParams(authId: event.authId));
    emit(result.fold(
      (failure) => AuthenticationErrorBlocState(_mapFailureToMessage(failure)),
      (success) => AuthenticationUnauthenticatedBlocState(),
    ));
  }

  Future<void> _onRefreshToken(RefreshTokenBlocEvent event,
      Emitter<AuthenticationBlocState> emit) async {
    emit(AuthenticationLoadingBlocState());
    final result =
        await refreshTokenUseCase(RefreshTokenParams(authId: event.authId));
    emit(result.fold(
      (failure) => AuthenticationErrorBlocState(_mapFailureToMessage(failure)),
      (authEntity) =>
          AuthenticationAuthenticatedBlocState(authEntity: authEntity),
    ));
  }

  Future<void> _onSwitchUser(
      SwitchUserBlocEvent event, Emitter<AuthenticationBlocState> emit) async {
    emit(AuthenticationLoadingBlocState());
    final result =
        await switchUserUseCase(SwitchUserParams(userId: event.userId));
    emit(result.fold(
      (failure) => AuthenticationErrorBlocState(_mapFailureToMessage(failure)),
      (authEntity) =>
          AuthenticationAuthenticatedBlocState(authEntity: authEntity),
    ));
  }
}
