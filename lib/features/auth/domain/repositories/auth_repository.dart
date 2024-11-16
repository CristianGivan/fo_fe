import 'package:dartz/dartz.dart';
import 'package:fo_fe/core/error/failures.dart';
import 'package:fo_fe/features/auth/domain/entities/auth_entity.dart';

abstract class AuthRepository {
  Future<Either<Failure, AuthEntity>> addAuth(int userId);

  Future<Either<Failure, void>> signOut(int authId);

  Future<Either<Failure, AuthEntity>> refreshToken(int authId);

  Future<Either<Failure, AuthEntity>> getActiveAuthForDeviceInfo();

  Future<Either<Failure, AuthEntity>> getLatestActiveAuthForDeviceInfo();

  Future<Either<Failure, AuthEntity>> getAuthForUserAndDeviceInfo(int userId);

  Future<Either<Failure, List<AuthEntity>>> getAuthItemsForDeviceInfo();

  Future<Either<Failure, void>> updateAuth(AuthEntity auth);
}
