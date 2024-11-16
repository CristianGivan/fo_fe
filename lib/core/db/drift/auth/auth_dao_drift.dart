import 'package:drift/drift.dart';
import 'package:fo_fe/core/db/drift/auth_drift_db.dart';
import 'package:fo_fe/core/db/drift/organizer_drift_exports.dart';

part 'auth_dao_drift.g.dart';

@DriftAccessor(tables: [AuthTableDrift])
class AuthDaoDrift extends DatabaseAccessor<AuthDriftDB> with _$AuthDaoDriftMixin {
  AuthDaoDrift(super.db);

  Future<AuthTableDriftG?> getAuthById(int id) =>
      (select(authTableDrift)..where((tbl) => tbl.id.equals(id))).getSingleOrNull();

  Future<AuthTableDriftG?> getAuthByUserId(int userId) =>
      (select(authTableDrift)..where((tbl) => tbl.userId.equals(userId))).getSingleOrNull();

  Future<List<AuthTableDriftG>> getAuthItemsAll() => select(authTableDrift).get();

  Stream<List<AuthTableDriftG>> watchAllAuths() => select(authTableDrift).watch();

  Future<int> addAuth(Insertable<AuthTableDriftG> auth) => into(authTableDrift).insert(auth);

  Future<bool> updateAuth(Insertable<AuthTableDriftG> auth) => update(authTableDrift).replace(auth);

  Future<int> deleteAuthById(int id) =>
      (delete(authTableDrift)..where((tbl) => tbl.id.equals(id))).go();

  Future<int> deleteAuthByUserId(int userId) =>
      (delete(authTableDrift)..where((tbl) => tbl.userId.equals(userId))).go();

  // todo -rem- remove it or change it is similr with getLatestActiveAuthForDeviceInfo
  Future<AuthTableDriftG?> getActiveAuthForDeviceInfo(String deviceInfo) {
    return (select(authTableDrift)
          ..where((tbl) => tbl.deviceInfo.equals(deviceInfo) & tbl.isActive.equals(true))
          ..orderBy([
            (tbl) => OrderingTerm.desc(tbl.lastUsedDate),
          ])
          ..limit(1))
        .getSingleOrNull();
  }

  Future<AuthTableDriftG?> getLatestActiveAuthForDeviceInfo(String deviceInfo) {
    return (select(authTableDrift)
          ..where((tbl) => tbl.deviceInfo.equals(deviceInfo) & tbl.isActive.equals(true))
          ..orderBy([
            (tbl) => OrderingTerm.desc(tbl.lastUsedDate),
          ])
          ..limit(1))
        .getSingleOrNull();
  }

  Future<AuthTableDriftG?> getAuthForUserAndDeviceInfo(int userId, String deviceInfo) {
    return (select(authTableDrift)
          ..where((tbl) => tbl.deviceInfo.equals(deviceInfo) & tbl.userId.equals(userId))
          ..orderBy([
            (tbl) => OrderingTerm.desc(tbl.lastUsedDate),
          ])
          ..limit(1))
        .getSingleOrNull();
  }

  Future<List<AuthTableDriftG>> getAuthsForDeviceInfo(String deviceInfo) =>
      (select(authTableDrift)..where((tbl) => tbl.deviceInfo.equals(deviceInfo))).get();
}
