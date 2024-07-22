import 'package:dartz/dartz.dart';
import 'package:fo_fe/core/error/failures.dart';
import 'package:fo_fe/core/util/DeviceInfo.dart';
import 'package:fo_fe/core/util/device_info_provider.dart';
import 'package:fo_fe/core/util/token_manager.dart';
import 'package:fo_fe/features/authentication/authentication_exports.dart';
import 'package:fo_fe/features/organizer/items/user/domain/entities/user_entity.dart';

class AuthenticationRepositoryDrift implements AuthenticationRepository {
  final AuthenticationLocalDataSource localDataSource;
  final TokenManager tokenManager;
  final DeviceInfo deviceInfo;

  AuthenticationRepositoryDrift({
    required this.localDataSource,
    required this.tokenManager,
    required this.deviceInfo,
  });

  @override
  Future<Either<Failure, AuthenticationEntity>> login(UserEntity user) async {
    try {
      // Simulate remote login (replace with actual remote call in the future)
      final token = TokenManager.generateToken(); // Generate token
      final encryptedToken = tokenManager.encryptToken(token); // Encrypt token

      final authModel = AuthenticationModel(
        userId: user.id,
        // Simulated user ID, replace with actual data
        token: encryptedToken,
        // Store encrypted token
        deviceInfo: DeviceInfoProvider.getDeviceInfo(),
        // Simulated device user ID, replace with actual data
        createdDate: DateTime.now(),
        expiredDate: DateTime.now().add(Duration(days: 30)),
        lastUsedDate: DateTime.now(),
        isActive: true,
      );
      await localDataSource.insertAuthentication(authModel);
      return Right(AuthenticationMapper.entityFromModel(authModel));
    } catch (e) {
      return Left(ServerFailure("ServerFailure"));
    }
  }

  @override
  Future<Either<Failure, void>> logout(int authId) async {
    try {
      final auth = await localDataSource.getAuthenticationById(authId);
      if (auth != null) {
        await localDataSource.deleteAuthenticationById(authId);
      }
      return Right(null);
    } catch (e) {
      return Left(ServerFailure("ServerFailure"));
    }
  }

  @override
  Future<Either<Failure, AuthenticationEntity>> refreshToken(int authId) async {
    final maxRefreshCount = 3;
    try {
      final auth = await localDataSource.getAuthenticationById(authId);
      if (auth != null) {
        if (auth.refreshCount >= maxRefreshCount) {
          // Enforce re-authentication
          return Left(
              ReauthenticationRequiredFailure("ReauthenticationRequired"));
        }

        // Generate a new token and update the expiration date and refresh count
        final newToken = TokenManager.generateToken();
        final encryptedToken = tokenManager.encryptToken(newToken);

        final updatedAuth = auth.copyWith(
          token: encryptedToken,
          lastUsedDate: DateTime.now(),
          expiredDate: DateTime.now().add(Duration(days: 30)),
          refreshCount: auth.refreshCount + 1,
        );

        await localDataSource.updateAuthentication(updatedAuth);
        return Right(AuthenticationMapper.entityFromModel(updatedAuth));
      }
      return Left(CacheFailure("CacheFailure"));
    } catch (e) {
      return Left(ServerFailure("ServerFailure"));
    }
  }

  @override
  Future<Either<Failure, AuthenticationEntity>>
      getActiveAuthenticationForDeviceInfo() async {
    try {
      final auth = await localDataSource
          .getActiveAuthenticationForDeviceInfo(deviceInfo.getDeviceInfo());
      return auth != null
          ? Right(AuthenticationMapper.entityFromModel(auth))
          : Left(CacheFailure("CacheFailure"));
    } catch (e) {
      return Left(CacheFailure("CacheFailure"));
    }
  }

  @override
  Future<Either<Failure, List<AuthenticationEntity>>>
      getAuthenticationsForDeviceInfo() async {
    try {
      final auths = await localDataSource
          .getAuthenticationsForDeviceInfo(deviceInfo.getDeviceInfo());
      if (auths == null) {
        return Left(NoActiveSessionFailure("NoActiveSessionFailure"));
      }
      return Right(auths
          .where((auth) => auth != null)
          .map(AuthenticationMapper
              .entityFromModel) // todo cg check if I had to put it in Mapper this
          .toList());
    } catch (e) {
      return Left(CacheFailure("CacheFailure"));
    }
  }

  @override
  Future<Either<Failure, void>> updateAuthentication(
      AuthenticationEntity auth) async {
    try {
      await localDataSource
          .updateAuthentication(AuthenticationMapper.modelFromEntity(auth));
      return Right(null);
    } catch (e) {
      return Left(CacheFailure("CacheFailure"));
    }
  }
}
