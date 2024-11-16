import 'package:fo_fe/core/db/drift/auth_drift_db.dart';

abstract class AuthLocalDataSource {
  Future<AuthTableDriftG?> getAuthById(int id);

  Future<AuthTableDriftG?> getAuthByUserId(int userId);

  Future<List<AuthTableDriftG>> getAllAuthItems();

  Future<int> addAuth(AuthTableDriftCompanion authCompanion);

  Future<bool> updateAuth(AuthTableDriftCompanion authCompanion);

  Future<void> deleteAuthById(int id);

  Future<void> deleteAuthByUserId(int userId);

  Future<AuthTableDriftG?> getActiveAuthForDeviceInfo(String deviceInfo);

  Future<AuthTableDriftG?> getLatestActiveAuthForDeviceInfo(String deviceInfo);

  Future<AuthTableDriftG?> getAuthForUserAndDeviceInfo(int userId, String deviceInfo);

  Future<List<AuthTableDriftG>?> getAuthItemsForDeviceInfo(String deviceInfo);
}
