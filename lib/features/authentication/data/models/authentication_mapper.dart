import 'package:drift/drift.dart';
import 'package:fo_fe/core/db/drift/authentication_drift_db.dart';
import 'package:fo_fe/features/authentication/authentication_exports.dart';

class AuthenticationMapper {
  static AuthenticationModel modelFromEntity(AuthenticationEntity auth) {
    return AuthenticationModel(
      id: auth.id,
      userId: auth.userId,
      token: auth.token,
      deviceInfo: auth.deviceInfo,
      createdDate: auth.createdDate,
      expiredDate: auth.expiredDate,
      lastUsedDate: auth.lastUsedDate,
      refreshCount: auth.refreshCount,
      isActive: auth.isActive,
    );
  }

  static AuthenticationEntity entityFromModel(AuthenticationModel? model) {
    if (model == null) {
      throw ArgumentError('AuthenticationModel cannot be null');
    }
    return AuthenticationEntity(
      id: model.id,
      userId: model.userId,
      token: model.token,
      deviceInfo: model.deviceInfo,
      createdDate: model.createdDate,
      expiredDate: model.expiredDate,
      lastUsedDate: model.lastUsedDate,
      refreshCount: model.refreshCount,
      isActive: model.isActive,
    );
  }

  static AuthenticationTableDriftCompanion tableDriftCompanionFromModel(
      AuthenticationModel model) {
    return AuthenticationTableDriftCompanion(
      userId: Value(model.userId),
      token: Value(model.token),
      deviceInfo: Value(model.deviceInfo),
      createdDate: Value(model.createdDate),
      expiredDate: Value(model.expiredDate),
      lastUsedDate: Value(model.lastUsedDate),
      refreshCount: Value(model.refreshCount),
      isActive: Value(model.isActive),
    );
  }

  static AuthenticationModel modelFromTableDrift(
      AuthenticationTableDriftG data) {
    return AuthenticationModel(
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

  static List<AuthenticationModel> modelItemsFromTableDriftItems(
      List<AuthenticationTableDriftG>? items) {
    if (items == null) {
      return List.empty();
    }
    return items.map(modelFromTableDrift).toList();
  }
}
