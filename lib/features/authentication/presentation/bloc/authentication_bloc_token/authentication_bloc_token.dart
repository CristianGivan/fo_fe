import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fo_fe/core/error/failures.dart';
import 'package:fo_fe/features/authentication/utils/authentication_exports.dart';

part 'authentication_bloc_token_event.dart';
part 'authentication_bloc_token_state.dart';

class AuthenticationBlocToken
    extends Bloc<AuthenticationBlocTokenEvent, AuthenticationBlocTokenState> {
  final LogoutUseCase logoutUseCase;
  final RefreshTokenUseCase refreshTokenUseCase;

  AuthenticationBlocToken({
    required this.logoutUseCase,
    required this.refreshTokenUseCase,
  }) : super(AuthenticationTokenInitial()) {
    on<LogoutBlocEvent>(_onLogout);
    on<RefreshTokenBlocEvent>(_onRefreshToken);
  }

  Future<void> _onLogout(
      LogoutBlocEvent event, Emitter<AuthenticationBlocTokenState> emit) async {
    emit(AuthenticationTokenLoading());

    final result = await logoutUseCase(LogoutParams(authId: event.authId));
    emit(result.fold(
      (failure) => AuthenticationTokenError(_mapFailureToMessage(failure)),
      (success) => AuthenticationTokenSuccess(),
    ));
  }

  Future<void> _onRefreshToken(RefreshTokenBlocEvent event,
      Emitter<AuthenticationBlocTokenState> emit) async {
    emit(AuthenticationTokenLoading());

    final result =
        await refreshTokenUseCase(RefreshTokenParams(authId: event.authId));
    emit(result.fold(
      (failure) => AuthenticationTokenError(_mapFailureToMessage(failure)),
      (authEntity) => AuthenticationTokenAuthenticated(authEntity: authEntity),
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
