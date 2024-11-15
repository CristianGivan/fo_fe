import 'package:dartz/dartz.dart';
import 'package:fo_fe/core/error/failures.dart';
import 'package:fo_fe/features/authentication/domain/entities/authentication_entity.dart';

abstract class AuthenticationRepository {
  Future<Either<Failure, AuthenticationEntity>> addAuthentication(int userId);

  Future<Either<Failure, void>> logout(int authId);

  Future<Either<Failure, AuthenticationEntity>> refreshToken(int authId);

  Future<Either<Failure, AuthenticationEntity>> getActiveAuthenticationForDeviceInfo();

  Future<Either<Failure, List<AuthenticationEntity>>> getAuthenticationsForDeviceInfo();

  Future<Either<Failure, void>> updateAuthentication(AuthenticationEntity auth);
}
