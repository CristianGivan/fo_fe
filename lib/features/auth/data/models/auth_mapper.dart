import 'package:drift/drift.dart';
import 'package:fo_fe/core/db/drift/auth_drift_db.dart';
import 'package:fo_fe/features/auth/utils/auth_exports.dart';

class AuthMapper {
  static AuthTableDriftCompanion companionFromEntity(AuthEntity entity) {
    return AuthTableDriftCompanion(
      id: entity.id == 0 ? Value.absent() : Value(entity.id),
      userId: Value(entity.userId),
      token: Value(entity.token),
      deviceInfo: Value(entity.deviceInfo),
      createdDate: Value(entity.createdDate),
      expiredDate: Value(entity.expiredDate),
      lastUsedDate: Value(entity.lastUsedDate),
      usedCount: Value(entity.usedCount),
      usedCountMax: Value(entity.usedCountMax),
      isActive: Value(entity.isActive),
      isAutoSignIn: Value(entity.isAutoSignIn),
    );
  }

  static AuthTableDriftCompanion companionFromTableDrift(AuthTableDriftG table) {
    return AuthTableDriftCompanion(
      id: Value(table.id),
      userId: Value(table.userId),
      token: Value(table.token),
      deviceInfo: Value(table.deviceInfo),
      createdDate: Value(table.createdDate),
      expiredDate: Value(table.expiredDate),
      lastUsedDate: Value(table.lastUsedDate),
      usedCount: Value(table.usedCount),
      usedCountMax: Value(table.usedCountMax),
      isActive: Value(table.isActive),
      isAutoSignIn: Value(table.isAutoSignIn),
    );
  }

  static AuthEntity entityFromTableDrift(AuthTableDriftG data) {
    return AuthEntity(
      id: data.id,
      userId: data.userId,
      token: data.token,
      deviceInfo: data.deviceInfo,
      createdDate: data.createdDate,
      expiredDate: data.expiredDate,
      lastUsedDate: data.lastUsedDate,
      usedCount: data.usedCount,
      usedCountMax: data.usedCountMax,
      isActive: data.isActive,
      isAutoSignIn: data.isAutoSignIn, // Assuming default value as it's not present in the table
    );
  }

  static AuthTableDriftG tableDriftFromCompanion(AuthTableDriftCompanion companion) {
    return AuthTableDriftG(
      id: companion.id.value,
      userId: companion.userId.value,
      token: companion.token.value,
      deviceInfo: companion.deviceInfo.value,
      createdDate: companion.createdDate.value,
      expiredDate: companion.expiredDate.value,
      lastUsedDate: companion.lastUsedDate.value,
      usedCount: companion.usedCount.value,
      usedCountMax: companion.usedCountMax.value,
      isActive: companion.isActive.value,
      isAutoSignIn: companion.isAutoSignIn.value,
    );
  }

  static List<AuthEntity> entityItemsFromTableDriftItems(List<AuthTableDriftG> items) {
    return items.map(entityFromTableDrift).toList();
  }
}
