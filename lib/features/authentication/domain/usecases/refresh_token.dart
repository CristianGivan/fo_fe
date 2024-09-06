import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:fo_fe/core/error/failures.dart';
import 'package:fo_fe/core/usecase/usecase.dart';
import 'package:fo_fe/features/authentication/config/authentication_exports.dart';

class RefreshTokenUseCase
    extends UseCase<AuthenticationEntity, RefreshTokenParams> {
  final AuthenticationRepository authRepository;

  RefreshTokenUseCase(this.authRepository);

  @override
  Future<Either<Failure, AuthenticationEntity>> call(
      RefreshTokenParams params) async {
    return await authRepository.refreshToken(params.authId);
  }
}

class RefreshTokenParams extends Equatable {
  final int authId;

  const RefreshTokenParams({required this.authId});

  @override
  List<Object?> get props => [authId];
}
