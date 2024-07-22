import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fo_fe/core/error/failures.dart';
import 'package:fo_fe/core/util/DeviceInfo.dart';
import 'package:fo_fe/core/util/organizer/core_util_organizer.dart';
import 'package:fo_fe/features/authentication/authentication_exports.dart';

part 'authentication_bloc_session_event.dart';
part 'authentication_bloc_session_state.dart';

class AuthenticationBlocSession extends Bloc<AuthenticationBlocSessionEvent,
    AuthenticationBlocSessionState> {
  final AutoLoginUseCase autoLoginUseCase;
  final GetLoggedInUserIdUseCase getLoggedInUserIdUseCase;
  final SwitchUserUseCase switchUserUseCase;

  AuthenticationBlocSession({
    required this.autoLoginUseCase,
    required this.getLoggedInUserIdUseCase,
    required this.switchUserUseCase,
  }) : super(AuthenticationSessionInitial()) {
    on<AutoLoginBlocEvent>(_onAutoLogin);
    on<GetLoggedInUserIdBlocEvent>(_onGetLoggedInUserId);
    on<SwitchUserBlocEvent>(_onSwitchUser);
  }

  Future<void> _onAutoLogin(AutoLoginBlocEvent event,
      Emitter<AuthenticationBlocSessionState> emit) async {
    emit(AuthenticationSessionLoading());

    final result = await autoLoginUseCase(NoParams());
    emit(result.fold(
      (failure) => AuthenticationSessionError(_mapFailureToMessage(failure)),
      (authEntity) =>
          AuthenticationSessionAuthenticated(authEntity: authEntity),
    ));
  }

  Future<void> _onGetLoggedInUserId(GetLoggedInUserIdBlocEvent event,
      Emitter<AuthenticationBlocSessionState> emit) async {
    emit(AuthenticationSessionLoading());

    final result = await getLoggedInUserIdUseCase(NoParams());
    emit(result.fold(
      (failure) => AuthenticationSessionError(_mapFailureToMessage(failure)),
      (userId) => AuthenticationUserIdLoaded(userId: userId),
    ));
  }

  Future<void> _onSwitchUser(SwitchUserBlocEvent event,
      Emitter<AuthenticationBlocSessionState> emit) async {
    emit(AuthenticationSessionLoading());

    final result =
        await switchUserUseCase(SwitchUserParams(userId: event.userId));
    emit(result.fold(
      (failure) => AuthenticationSessionError(_mapFailureToMessage(failure)),
      (authEntity) =>
          AuthenticationSessionAuthenticated(authEntity: authEntity),
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
