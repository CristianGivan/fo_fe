import 'package:fo_fe/core/db/drift/authentication_drift_db.dart';
import 'package:fo_fe/features/authentication/config/authentication_exports.dart';

class AuthenticationLocalDataSourceDrift
    implements AuthenticationLocalDataSource {
  final AuthenticationDriftDB database;

  AuthenticationLocalDataSourceDrift({required this.database});

  @override
  Future<AuthenticationModel?> getAuthenticationById(int id) async {
    final result =
        await database.authenticationDaoDrift.getAuthenticationById(id);
    return result != null
        ? AuthenticationMapper.modelFromTableDrift(result)
        : null;
  }

  @override
  Future<AuthenticationModel?> getAuthenticationByUserId(int userId) async {
    final result =
        await database.authenticationDaoDrift.getAuthenticationByUserId(userId);
    return result != null
        ? AuthenticationMapper.modelFromTableDrift(result)
        : null;
  }

  @override
  Future<List<AuthenticationModel>> getAllAuthentications() async {
    final results =
        await database.authenticationDaoDrift.getAuthenticationItemsAll();
    return AuthenticationMapper.modelItemsFromTableDriftItems(results);
  }

  @override
  Future<void> insertAuthentication(AuthenticationModel auth) async {
    final companion = AuthenticationMapper.tableDriftCompanionFromModel(auth);
    await database.authenticationDaoDrift.insertAuthentication(companion);
  }

  @override
  Future<void> updateAuthentication(AuthenticationModel auth) async {
    final companion = AuthenticationMapper.tableDriftCompanionFromModel(auth);
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
  Future<AuthenticationModel?> getActiveAuthenticationForDeviceInfo(
      String deviceInfo) async {
    final result = await database.authenticationDaoDrift
        .getActiveAuthenticationForDeviceInfo(deviceInfo);
    return result != null
        ? AuthenticationMapper.modelFromTableDrift(result)
        : null;
  }

  @override
  Future<List<AuthenticationModel?>> getAuthenticationsForDeviceInfo(
      String deviceInfo) async {
    final results = await database.authenticationDaoDrift
        .getAuthenticationsForDeviceInfo(deviceInfo);
    return AuthenticationMapper.modelItemsFromTableDriftItems(results);
  }
}
