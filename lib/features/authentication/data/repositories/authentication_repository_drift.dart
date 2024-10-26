import 'package:dartz/dartz.dart';
import 'package:fo_fe/core/error/failures.dart';
import 'package:fo_fe/core/utils/exports/core_utils_exports.dart';
import 'package:fo_fe/features/authentication/utils/authentication_exports.dart';
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
  Future<Either<Failure, AuthenticationEntity>> addAuthentication(
      UserEntity user) async {
    return _handleDatabaseOperation(() async {
      final token = TokenManager.generateToken();
      final encryptedToken = tokenManager.encryptToken(token);

      final authEntity = AuthenticationEntity(
        userId: user.id,
        token: encryptedToken,
        deviceInfo: deviceInfo.getDeviceInfo(),
        createdDate: DateTime.now(),
        expiredDate: DateTime.now().add(const Duration(days: 30)),
        lastUsedDate: DateTime.now(),
        isActive: true,
      );
      final authCompanionDrift =
          AuthenticationMapper.companionFromEntity(authEntity);
      await localDataSource.addAuthentication(authCompanionDrift);
      return authEntity;
    });
  }

  @override
  Future<Either<Failure, void>> logout(int authId) async {
    return _handleDatabaseOperation(() async {
      final auth = await localDataSource.getAuthenticationById(authId);
      _checkItemNotNull(auth);
      await localDataSource.deleteAuthenticationById(authId);
    });
  }

  @override
  Future<Either<Failure, AuthenticationEntity>> refreshToken(int authId) async {
    const maxRefreshCount = 3;
    return _handleDatabaseOperation(() async {
      final auth = await localDataSource.getAuthenticationById(authId);
      _checkItemNotNull(auth);

      if (auth!.refreshCount >= maxRefreshCount) {
        throw const ReauthenticationRequiredFailure("ReauthenticationRequired");
      }

      final newToken = TokenManager.generateToken();
      final encryptedToken = tokenManager.encryptToken(newToken);

      final updatedAuth = auth.copyWith(
        token: encryptedToken,
        lastUsedDate: DateTime.now(),
        expiredDate: DateTime.now().add(const Duration(days: 30)),
        refreshCount: auth.refreshCount + 1,
      );
      final updatedAuthTable =
          AuthenticationMapper.companionFromTableDrift(updatedAuth);
      await localDataSource.updateAuthentication(updatedAuthTable);
      return AuthenticationMapper.entityFromTableDrift(updatedAuth);
    });
  }

  @override
  Future<Either<Failure, AuthenticationEntity>>
      getActiveAuthenticationForDeviceInfo() async {
    return _handleDatabaseOperation(() async {
      final auth = await localDataSource
          .getActiveAuthenticationForDeviceInfo(deviceInfo.getDeviceInfo());
      _checkItemNotNull(auth);
      return AuthenticationMapper.entityFromTableDrift(auth!);
    });
  }

  @override
  Future<Either<Failure, List<AuthenticationEntity>>>
      getAuthenticationsForDeviceInfo() async {
    return _handleDatabaseOperation(() async {
      final auths = await localDataSource
          .getAuthenticationItemsForDeviceInfo(deviceInfo.getDeviceInfo());
      _checkItemsNotNullOrEmpty(auths);
      return AuthenticationMapper.entityItemsFromTableDriftItems(auths!);
    });
  }

  @override
  Future<Either<Failure, void>> updateAuthentication(
      AuthenticationEntity auth) async {
    final companion = AuthenticationMapper.companionFromEntity(auth);
    return _handleDatabaseOperation(() async {
      await localDataSource.updateAuthentication(companion);
    });
  }

  Future<Either<Failure, T>> _handleDatabaseOperation<T>(
      Future<T> Function() operation) async {
    try {
      final result = await operation();
      return Right(result);
    } catch (e) {
      if (e is Failure) {
        return Left(e);
      } else {
        return Left(LocalFailure(e.toString()));
      }
    }
  }

  void _checkItemNotNull(dynamic item) {
    if (item == null) {
      throw const AuthenticationNotFoundFailure("Authentication not found");
    }
  }

  void _checkItemsNotNullOrEmpty(List<dynamic>? items) {
    if (items == null || items.isEmpty) {
      throw const AuthenticationNotFoundFailure("No authentications found");
    }
  }
}
