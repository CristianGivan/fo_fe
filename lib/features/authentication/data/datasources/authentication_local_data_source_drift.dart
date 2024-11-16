import 'package:fo_fe/core/db/drift/authentication_drift_db.dart';
import 'package:fo_fe/features/authentication/utils/authentication_exports.dart';

class AuthenticationLocalDataSourceDrift implements AuthenticationLocalDataSource {
  final AuthenticationDriftDB database;

  AuthenticationLocalDataSourceDrift({required this.database});

  @override
  Future<AuthenticationTableDriftG?> getAuthenticationById(int id) async {
    return await database.authenticationDaoDrift.getAuthenticationById(id);
  }

  @override
  Future<AuthenticationTableDriftG?> getAuthenticationByUserId(int userId) async {
    return await database.authenticationDaoDrift.getAuthenticationByUserId(userId);
  }

  @override
  Future<List<AuthenticationTableDriftG>> getAllAuthentications() async {
    return await database.authenticationDaoDrift.getAuthenticationItemsAll();
  }

  @override
  Future<int> addAuthentication(AuthenticationTableDriftCompanion companion) async {
    return await database.authenticationDaoDrift.addAuthentication(companion);
  }

  @override
  Future<void> updateAuthentication(AuthenticationTableDriftCompanion companion) async {
    await database.authenticationDaoDrift.updateAuthentication(companion);
  }

  @override
  Future<void> deleteAuthenticationById(int id) async {
    await database.authenticationDaoDrift.deleteAuthenticationById(id);
  }

  @override
  Future<void> deleteAuthenticationByUserId(int userId) async {
    await database.authenticationDaoDrift.deleteAuthenticationByUserId(userId);
  }

  @override
  Future<AuthenticationTableDriftG?> getActiveAuthenticationForDeviceInfo(String deviceInfo) async {
    return await database.authenticationDaoDrift.getActiveAuthenticationForDeviceInfo(deviceInfo);
  }

  @override
  Future<AuthenticationTableDriftG?> getLatestActiveAuthForDeviceInfo(String deviceInfo) async {
    return await database.authenticationDaoDrift.getLatestActiveAuthForDeviceInfo(deviceInfo);
  }

  @override
  Future<AuthenticationTableDriftG?> getAuthenticationForUserAndDeviceInfo(
      int userId, String deviceInfo) async {
    return await database.authenticationDaoDrift
        .getAuthenticationForUserAndDeviceInfo(userId, deviceInfo);
  }

  @override
  Future<List<AuthenticationTableDriftG>?> getAuthenticationItemsForDeviceInfo(
      String deviceInfo) async {
    return await database.authenticationDaoDrift.getAuthenticationsForDeviceInfo(deviceInfo);
  }
}
