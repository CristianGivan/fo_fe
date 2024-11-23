part of 'auth_log_bloc.dart';

abstract class AuthSignBlocState extends Equatable {
  const AuthSignBlocState();

  @override
  List<Object?> get props => [];
}

class AuthLogInitialBlocState extends AuthSignBlocState {}

class AuthLogLoadingBlocState extends AuthSignBlocState {
  final AuthOperation operation;

  const AuthLogLoadingBlocState(this.operation);

  @override
  List<Object?> get props => [operation];
}

class AuthAuthenticatedBlocState extends AuthSignBlocState {
  final AuthEntity authEntity;
  final UserEntity userEntity;
  final AuthOperation operationType;

  const AuthAuthenticatedBlocState({
    required this.authEntity,
    required this.userEntity,
    required this.operationType,
  });

  @override
  List<Object?> get props => [authEntity, userEntity, operationType];
}

class AuthLogOutSuccessBlocState extends AuthSignBlocState {}

class AuthUnauthenticatedBlocState extends AuthSignBlocState {
  final String? reason;

  const AuthUnauthenticatedBlocState({this.reason});

  @override
  List<Object?> get props => [reason];
}

class AuthLogFailedBlocState extends AuthSignBlocState {
  final String error;

  const AuthLogFailedBlocState(this.error);

  @override
  List<Object> get props => [error];
}

class AuthLogErrorBlocState extends AuthSignBlocState {
  final String errorMessage;

  const AuthLogErrorBlocState(this.errorMessage);

  @override
  List<Object?> get props => [errorMessage];
}
