import 'package:drift/drift.dart';
import 'package:fo_fe/core/db/drift/authentication_drift_db.dart';
import 'package:fo_fe/core/db/drift/organizer_drift_exports.dart';

part 'authentication_dao_drift.g.dart';

@DriftAccessor(tables: [AuthenticationTableDrift])
class AuthenticationDaoDrift extends DatabaseAccessor<AuthenticationDriftDB>
    with _$AuthenticationDaoDriftMixin {
  AuthenticationDaoDrift(super.db);

  Future<AuthenticationTableDriftG?> getAuthenticationById(int id) =>
      (select(authenticationTableDrift)..where((tbl) => tbl.id.equals(id))).getSingleOrNull();

  Future<AuthenticationTableDriftG?> getAuthenticationByUserId(int userId) =>
      (select(authenticationTableDrift)..where((tbl) => tbl.userId.equals(userId)))
          .getSingleOrNull();

  Future<List<AuthenticationTableDriftG>> getAuthenticationItemsAll() =>
      select(authenticationTableDrift).get();

  Stream<List<AuthenticationTableDriftG>> watchAllAuthentications() =>
      select(authenticationTableDrift).watch();

  Future<int> addAuthentication(Insertable<AuthenticationTableDriftG> auth) =>
      into(authenticationTableDrift).insert(auth);

  Future<bool> updateAuthentication(Insertable<AuthenticationTableDriftG> auth) =>
      update(authenticationTableDrift).replace(auth);

  Future<int> deleteAuthenticationById(int id) =>
      (delete(authenticationTableDrift)..where((tbl) => tbl.id.equals(id))).go();

  Future<int> deleteAuthenticationByUserId(int userId) =>
      (delete(authenticationTableDrift)..where((tbl) => tbl.userId.equals(userId))).go();

  // todo -rem- remove it or change it is similr with getLatestActiveAuthForDeviceInfo
  Future<AuthenticationTableDriftG?> getActiveAuthenticationForDeviceInfo(String deviceInfo) {
    return (select(authenticationTableDrift)
          ..where((tbl) => tbl.deviceInfo.equals(deviceInfo) & tbl.isActive.equals(true))
          ..orderBy([
            (tbl) => OrderingTerm.desc(tbl.lastUsedDate),
          ])
          ..limit(1))
        .getSingleOrNull();
  }

  Future<AuthenticationTableDriftG?> getLatestActiveAuthForDeviceInfo(String deviceInfo) {
    return (select(authenticationTableDrift)
          ..where((tbl) => tbl.deviceInfo.equals(deviceInfo) & tbl.isActive.equals(true))
          ..orderBy([
            (tbl) => OrderingTerm.desc(tbl.lastUsedDate),
          ])
          ..limit(1))
        .getSingleOrNull();
  }

  Future<AuthenticationTableDriftG?> getAuthenticationForUserAndDeviceInfo(
      int userId, String deviceInfo) {
    return (select(authenticationTableDrift)
          ..where((tbl) => tbl.deviceInfo.equals(deviceInfo) & tbl.userId.equals(userId))
          ..orderBy([
            (tbl) => OrderingTerm.desc(tbl.lastUsedDate),
          ])
          ..limit(1))
        .getSingleOrNull();
  }

  Future<List<AuthenticationTableDriftG>> getAuthenticationsForDeviceInfo(String deviceInfo) =>
      (select(authenticationTableDrift)..where((tbl) => tbl.deviceInfo.equals(deviceInfo))).get();
}
