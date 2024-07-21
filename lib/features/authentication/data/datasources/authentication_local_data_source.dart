import 'package:fo_fe/features/authentication/authentication_exports.dart';

abstract class AuthenticationLocalDataSource {
  Future<AuthenticationModel?> getAuthenticationById(int id);

  Future<AuthenticationModel?> getAuthenticationByUserId(int userId);

  Future<List<AuthenticationModel>> getAllAuthentications();

  Future<void> insertAuthentication(AuthenticationModel auth);

  Future<void> updateAuthentication(AuthenticationModel auth);

  Future<void> deleteAuthenticationById(int id);

  Future<void> deleteAuthenticationByUserId(int userId);

  Future<AuthenticationModel?> getActiveAuthenticationForDeviceInfo(
      String deviceInfo);

  Future<List<AuthenticationModel?>?> getAuthenticationsForDeviceInfo(
      String deviceInfo);
}
