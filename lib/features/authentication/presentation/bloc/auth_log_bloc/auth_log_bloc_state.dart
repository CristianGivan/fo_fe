part of 'auth_log_bloc.dart';

abstract class AuthLogBlocState extends Equatable {
  const AuthLogBlocState();

  @override
  List<Object?> get props => [];
}

class AuthLogInitialBlocState extends AuthLogBlocState {}

class AuthLogLoadingBlocState extends AuthLogBlocState {
  final AuthOperation operation;

  const AuthLogLoadingBlocState(this.operation);

  @override
  List<Object?> get props => [operation];
}

class AuthAuthenticatedBlocState extends AuthLogBlocState {
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

class AuthLogOutSuccessBlocState extends AuthLogBlocState {}

class AuthUnauthenticatedBlocState extends AuthLogBlocState {
  final String? reason;

  const AuthUnauthenticatedBlocState({this.reason});

  @override
  List<Object?> get props => [reason];
}

class AuthLogFailedBlocState extends AuthLogBlocState {
  final String error;

  const AuthLogFailedBlocState(this.error);

  @override
  List<Object> get props => [error];
}

class AuthLogErrorBlocState extends AuthLogBlocState {
  final String errorMessage;

  const AuthLogErrorBlocState(this.errorMessage);

  @override
  List<Object?> get props => [errorMessage];
}
