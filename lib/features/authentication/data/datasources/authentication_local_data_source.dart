import 'package:fo_fe/core/db/drift/authentication_drift_db.dart';

abstract class AuthenticationLocalDataSource {
  Future<AuthenticationTableDriftG?> getAuthenticationById(int id);

  Future<AuthenticationTableDriftG?> getAuthenticationByUserId(int userId);

  Future<List<AuthenticationTableDriftG>> getAllAuthentications();

  Future<void> addAuthentication(
      AuthenticationTableDriftCompanion autehnticationCompanion);

  Future<void> updateAuthentication(
      AuthenticationTableDriftCompanion autehnticationCompanion);

  Future<void> deleteAuthenticationById(int id);

  Future<void> deleteAuthenticationByUserId(int userId);

  Future<AuthenticationTableDriftG?> getActiveAuthenticationForDeviceInfo(
      String deviceInfo);

  Future<List<AuthenticationTableDriftG>?> getAuthenticationItemsForDeviceInfo(
      String deviceInfo);
}
