import 'package:dartz/dartz.dart';
import 'package:fo_fe/core/error/failures.dart';
import 'package:fo_fe/features/authentication/domain/entities/auth_entity.dart';

abstract class AuthRepository {
  Future<Either<Failure, AuthEntity>> addAuthWithUserId(int userId);

  Future<Either<Failure, AuthEntity>> addAuthWithUserIdAndAutoSingIn(int userId, bool isAutoSignIn);

  Future<Either<Failure, void>> signOut(int authId);

  Future<Either<Failure, AuthEntity>> refreshToken(int authId);

  Future<Either<Failure, AuthEntity>> getActiveAuthForDeviceInfo();

  Future<Either<Failure, AuthEntity>> getLatestActiveAuthForDeviceInfo();

  Future<Either<Failure, AuthEntity>> getAuthForUserAndDeviceInfo(int userId);

  Future<Either<Failure, List<AuthEntity>>> getAuthItemsForDeviceInfo();

  Future<Either<Failure, AuthEntity>> updateAuth(AuthEntity auth);
}
