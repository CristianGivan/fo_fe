import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fo_fe/core/error/failures.dart';
import 'package:fo_fe/features/authentication/utils/auth_exports.dart';
import 'package:fo_fe/features/authentication/utils/other/auth_params.dart';

part 'auth_token_bloc_event.dart';
part 'auth_token_bloc_state.dart';

class AuthTokenBloc extends Bloc<AuthTokenBlocEvent, AuthTokenBlocState> {
  final SignOutUseCase logoutUseCase;
  final RefreshTokenUseCase refreshTokenUseCase;

  AuthTokenBloc({
    required this.logoutUseCase,
    required this.refreshTokenUseCase,
  }) : super(AuthTokenInitial()) {
    on<LogoutBlocEvent>(_onLogout);
    on<RefreshTokenBlocEvent>(_onRefreshToken);
  }

  Future<void> _onLogout(LogoutBlocEvent event, Emitter<AuthTokenBlocState> emit) async {
    emit(AuthTokenLoading());

    final result = await logoutUseCase(AuthParams(authId: event.authId));
    emit(result.fold(
      (failure) => AuthTokenError(_mapFailureToMessage(failure)),
      (success) => AuthTokenSuccess(),
    ));
  }

  Future<void> _onRefreshToken(
      RefreshTokenBlocEvent event, Emitter<AuthTokenBlocState> emit) async {
    emit(AuthTokenLoading());

    final result = await refreshTokenUseCase(AuthParams(authId: event.authId));
    emit(result.fold(
      (failure) => AuthTokenError(_mapFailureToMessage(failure)),
      (authEntity) => AuthTokenAuthenticated(authEntity: authEntity),
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
