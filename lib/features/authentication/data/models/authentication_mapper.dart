import 'package:drift/drift.dart';
import 'package:fo_fe/core/db/drift/authentication_drift_db.dart';
import 'package:fo_fe/features/authentication/config/authentication_exports.dart';

class AuthenticationMapper {
  static AuthenticationTableDriftCompanion companionFromEntity(
      AuthenticationEntity entity) {
    return AuthenticationTableDriftCompanion(
      userId: Value(entity.userId),
      token: Value(entity.token),
      deviceInfo: Value(entity.deviceInfo),
      createdDate: Value(entity.createdDate),
      expiredDate: Value(entity.expiredDate),
      lastUsedDate: Value(entity.lastUsedDate),
      refreshCount: Value(entity.refreshCount),
      isActive: Value(entity.isActive),
    );
  }

  static AuthenticationTableDriftCompanion companionFromTableDrift(
      AuthenticationTableDriftG table) {
    return AuthenticationTableDriftCompanion(
      id: Value(table.id),
      userId: Value(table.userId),
      token: Value(table.token),
      deviceInfo: Value(table.deviceInfo),
      createdDate: Value(table.createdDate),
      expiredDate: Value(table.expiredDate),
      lastUsedDate: Value(table.lastUsedDate),
      refreshCount: Value(table.refreshCount),
      isActive: Value(table.isActive),
    );
  }

  static AuthenticationEntity entityFromTableDrift(
      AuthenticationTableDriftG data) {
    return AuthenticationEntity(
      id: data.id,
      userId: data.userId,
      token: data.token,
      deviceInfo: data.deviceInfo,
      createdDate: data.createdDate,
      expiredDate: data.expiredDate,
      lastUsedDate: data.lastUsedDate,
      refreshCount: data.refreshCount,
      isActive: data.isActive,
    );
  }

  static AuthenticationTableDriftG tableDriftFromCompanion(
      AuthenticationTableDriftCompanion companion) {
    return AuthenticationTableDriftG(
      id: companion.id.value,
      userId: companion.userId.value,
      token: companion.token.value,
      deviceInfo: companion.deviceInfo.value,
      createdDate: companion.createdDate.value,
      expiredDate: companion.expiredDate.value,
      lastUsedDate: companion.lastUsedDate.value,
      refreshCount: companion.refreshCount.value,
      isActive: companion.isActive.value,
    );
  }

  static List<AuthenticationEntity> entityItemsFromTableDriftItems(
      List<AuthenticationTableDriftG> items) {
    return items.map(entityFromTableDrift).toList();
  }
}
