import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fo_fe/core/error/failures.dart';
import 'package:fo_fe/features/authentication/utils/authentication_exports.dart';
import 'package:fo_fe/features/authentication/utils/other/auth_params.dart';

part 'authentication_token_bloc_event.dart';
part 'authentication_token_bloc_state.dart';

class AuthenticationTokenBloc
    extends Bloc<AuthenticationTokenBlocEvent, AuthenticationTokenBlocState> {
  final SignOutUseCase logoutUseCase;
  final RefreshTokenUseCase refreshTokenUseCase;

  AuthenticationTokenBloc({
    required this.logoutUseCase,
    required this.refreshTokenUseCase,
  }) : super(AuthenticationTokenInitial()) {
    on<LogoutBlocEvent>(_onLogout);
    on<RefreshTokenBlocEvent>(_onRefreshToken);
  }

  Future<void> _onLogout(LogoutBlocEvent event, Emitter<AuthenticationTokenBlocState> emit) async {
    emit(AuthenticationTokenLoading());

    final result = await logoutUseCase(AuthParams(authId: event.authId));
    emit(result.fold(
      (failure) => AuthenticationTokenError(_mapFailureToMessage(failure)),
      (success) => AuthenticationTokenSuccess(),
    ));
  }

  Future<void> _onRefreshToken(
      RefreshTokenBlocEvent event, Emitter<AuthenticationTokenBlocState> emit) async {
    emit(AuthenticationTokenLoading());

    final result = await refreshTokenUseCase(RefreshTokenParams(authId: event.authId));
    emit(result.fold(
      (failure) => AuthenticationTokenError(_mapFailureToMessage(failure)),
      (authEntity) => AuthenticationTokenAuthenticated(authEntity: authEntity),
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
