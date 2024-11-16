import 'package:dartz/dartz.dart';
import 'package:fo_fe/core/error/failures.dart';
import 'package:fo_fe/core/utils/exports/core_utils_exports.dart';

import '../../utils/authentication_exports.dart';

class AuthRepositoryDrift implements AuthRepository {
  final AuthenticationLocalDataSource localDataSource;
  final TokenManager tokenManager;
  final DeviceInfo deviceInfo;

  AuthRepositoryDrift({
    required this.localDataSource,
    required this.tokenManager,
    required this.deviceInfo,
  });

  @override
  Future<Either<Failure, AuthEntity>> addAuth(int userId) async {
    return _handleDatabaseOperation(() async {
      final token = TokenManager.generateToken();
      final encryptedToken = tokenManager.encryptToken(token);

      final authEntity = AuthEntity(
        userId: userId,
        token: encryptedToken,
        deviceInfo: deviceInfo.getDeviceInfo(),
        createdDate: DateTime.now(),
        expiredDate: DateTime.now().add(const Duration(days: 30)),
        lastUsedDate: DateTime.now(),
        isActive: true,
      );
      final authCompanionDrift = AuthenticationMapper.companionFromEntity(authEntity);
      final authId = await localDataSource.addAuthentication(authCompanionDrift);
      return authEntity.copyWith(id: authId);
    });
  }

  @override
  Future<Either<Failure, void>> signOut(int authId) async {
    return _handleDatabaseOperation(() async {
      final authTable = await localDataSource.getAuthenticationById(authId);
      _checkItemNotNull(authTable);
      final auth = AuthenticationMapper.entityFromTableDrift(authTable!);

      if (auth.isTokenExpired()) {
        await localDataSource.deleteAuthenticationById(auth.id);
      } else {
        final updatedAuth = auth.copyWith(isActive: false);
        final updatedAuthTable = AuthenticationMapper.companionFromEntity(updatedAuth);
        await localDataSource.updateAuthentication(updatedAuthTable);
      }
    });
  }

  @override
  Future<Either<Failure, AuthEntity>> refreshToken(int authId) async {
    return _handleDatabaseOperation(() async {
      // todo -improve- do not convert so many times
      final authTable = await localDataSource.getAuthenticationById(authId);
      _checkItemNotNull(authTable);
      final auth = AuthenticationMapper.entityFromTableDrift(authTable!);

      if (auth.isTokenExpired()) {
        throw const ReauthenticationRequiredFailure("ReauthenticationRequired");
      }

      final newToken = TokenManager.generateToken();
      final encryptedToken = tokenManager.encryptToken(newToken);

      final updatedAuth = auth.copyWith(
        token: encryptedToken,
        lastUsedDate: DateTime.now(),
        expiredDate: DateTime.now().add(const Duration(days: 30)),
        usedCount: auth.usedCountMax,
      );
      final updatedAuthTable = AuthenticationMapper.companionFromEntity(updatedAuth);
      //todo -improve- in case of a failure?
      await localDataSource.updateAuthentication(updatedAuthTable);
      return updatedAuth;
    });
  }

  @override
  Future<Either<Failure, AuthEntity>> getActiveAuthForDeviceInfo() async {
    return _handleDatabaseOperation(() async {
      final auth =
          await localDataSource.getActiveAuthenticationForDeviceInfo(deviceInfo.getDeviceInfo());
      _checkItemNotNull(auth);
      return AuthenticationMapper.entityFromTableDrift(auth!);
    });
  }

  @override
  Future<Either<Failure, AuthEntity>> getLatestActiveAuthForDeviceInfo() async {
    return _handleDatabaseOperation(() async {
      final auth =
          await localDataSource.getLatestActiveAuthForDeviceInfo(deviceInfo.getDeviceInfo());
      _checkItemNotNull(auth);
      return AuthenticationMapper.entityFromTableDrift(auth!);
    });
  }

  @override
  Future<Either<Failure, AuthEntity>> getAuthForUserAndDeviceInfo(int userId) async {
    return _handleDatabaseOperation(() async {
      final auth = await localDataSource.getAuthenticationForUserAndDeviceInfo(
          userId, deviceInfo.getDeviceInfo());
      _checkItemNotNull(auth);
      return AuthenticationMapper.entityFromTableDrift(auth!);
    });
  }

  @override
  Future<Either<Failure, List<AuthEntity>>> getAuthItemsForDeviceInfo() async {
    return _handleDatabaseOperation(() async {
      final auths =
          await localDataSource.getAuthenticationItemsForDeviceInfo(deviceInfo.getDeviceInfo());
      _checkItemsNotNullOrEmpty(auths);
      return AuthenticationMapper.entityItemsFromTableDriftItems(auths!);
    });
  }

  @override
  Future<Either<Failure, void>> updateAuth(AuthEntity auth) async {
    final companion = AuthenticationMapper.companionFromEntity(auth);
    return _handleDatabaseOperation(() async {
      await localDataSource.updateAuthentication(companion);
    });
  }

  Future<Either<Failure, T>> _handleDatabaseOperation<T>(Future<T> Function() operation) async {
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
