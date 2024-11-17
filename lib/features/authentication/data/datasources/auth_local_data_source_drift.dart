import 'package:fo_fe/core/db/drift/auth_drift_db.dart';
import 'package:fo_fe/features/authentication/utils/auth_exports.dart';

class AuthLocalDataSourceDrift implements AuthLocalDataSource {
  final AuthDriftDB database;

  AuthLocalDataSourceDrift({required this.database});

  @override
  Future<AuthTableDriftG?> getAuthById(int id) async {
    return await database.authDaoDrift.getAuthById(id);
  }

  @override
  Future<AuthTableDriftG?> getAuthByUserId(int userId) async {
    return await database.authDaoDrift.getAuthByUserId(userId);
  }

  @override
  Future<List<AuthTableDriftG>> getAllAuthItems() async {
    return await database.authDaoDrift.getAuthItemsAll();
  }

  @override
  Future<int> addAuth(AuthTableDriftCompanion companion) async {
    return await database.authDaoDrift.addAuth(companion);
  }

  @override
  Future<bool> updateAuth(AuthTableDriftCompanion companion) async {
    return await database.authDaoDrift.updateAuth(companion);
  }

  @override
  Future<void> deleteAuthById(int id) async {
    await database.authDaoDrift.deleteAuthById(id);
  }

  @override
  Future<void> deleteAuthByUserId(int userId) async {
    await database.authDaoDrift.deleteAuthByUserId(userId);
  }

  @override
  Future<AuthTableDriftG?> getActiveAuthForDeviceInfo(String deviceInfo) async {
    return await database.authDaoDrift.getActiveAuthForDeviceInfo(deviceInfo);
  }

  @override
  Future<AuthTableDriftG?> getLatestActiveAuthForDeviceInfo(String deviceInfo) async {
    return await database.authDaoDrift.getLatestActiveAuthForDeviceInfo(deviceInfo);
  }

  @override
  Future<AuthTableDriftG?> getAuthForUserAndDeviceInfo(int userId, String deviceInfo) async {
    return await database.authDaoDrift.getAuthForUserAndDeviceInfo(userId, deviceInfo);
  }

  @override
  Future<List<AuthTableDriftG>?> getAuthItemsForDeviceInfo(String deviceInfo) async {
    return await database.authDaoDrift.getAuthsForDeviceInfo(deviceInfo);
  }
}
