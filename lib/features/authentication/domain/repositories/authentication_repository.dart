import 'package:dartz/dartz.dart';
import 'package:fo_fe/core/error/failures.dart';
import 'package:fo_fe/features/authentication/domain/entities/authentication_entity.dart';
import 'package:fo_fe/features/organizer/items/user/domain/entities/user_entity.dart';

abstract class AuthenticationRepository {
  Future<Either<Failure, AuthenticationEntity>> login(
      UserEntity user, String deviceInfo);

  Future<Either<Failure, void>> logout(int authId);

  Future<Either<Failure, AuthenticationEntity>> refreshToken(int authId);

  Future<Either<Failure, AuthenticationEntity>>
      getActiveAuthenticationForDeviceInfo(String deviceInfo);

  Future<Either<Failure, List<AuthenticationEntity>>>
      getAuthenticationsForDeviceInfo(String deviceInfo);

  Future<Either<Failure, void>> updateAuthentication(AuthenticationEntity auth);
}
