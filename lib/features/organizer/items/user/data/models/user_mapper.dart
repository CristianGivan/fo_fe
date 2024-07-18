import 'package:drift/drift.dart';
import 'package:fo_fe/core/db/drift/organizer_drift_exports.dart';
import 'package:fo_fe/core/util/organizer/core_util_organizer.dart';
import 'package:fo_fe/features/organizer/items/user/user_exports.dart';

class UserMapper {
  static UserModel modelFromTableDrift(UserTableDriftG user) {
    return UserModel(
      id: user.id,
      name: user.name,
      hashedPassword: user.hashedPassword,
      email: user.email,
      createdDate: user.createdDate,
    );
  }

  static OrganizerItems<UserModel> modelItemsFromTableDriftItems(
      List<UserTableDriftG>? items) {
    if (items == null) {
      return OrganizerItems.empty();
    }
    return OrganizerItems.of(items.map(modelFromTableDrift).toList());
  }

  static UserModel entityToModel(UserEntity? user) {
    if (user == null) {
      return UserModel.empty();
    }
    return UserModel(
      id: user.id,
      name: user.name,
      hashedPassword: user.hashedPassword,
      email: user.email,
      createdDate: user.createdDate,
    );
  }

  static OrganizerItems<UserModel> entityItemsToModelItems(
      OrganizerItems<UserEntity>? items) {
    if (items == null) {
      return OrganizerItems.empty();
    }
    return OrganizerItems.of(items.map(entityToModel).toList());
  }

  static UserEntity modelToEntity(UserModel user) {
    return UserEntity(
      id: user.id,
      name: user.name,
      hashedPassword: user.hashedPassword,
      email: user.email,
      createdDate: user.createdDate,
    );
  }

  static OrganizerItems<UserEntity> modelItemsToEntityItems(
      OrganizerItems<UserModel>? models) {
    if (models == null) {
      return OrganizerItems.empty();
    }
    return OrganizerItems.of(models.map(modelToEntity).toList());
  }

  static UserTableDriftCompanion modelToCompanion(UserModel user) {
    return UserTableDriftCompanion(
      id: Value(user.id),
      name: Value(user.name),
      hashedPassword: Value(user.hashedPassword),
      email: Value(user.email),
      createdDate: Value(user.createdDate),
    );
  }

  static UserTableDriftCompanion entityToCompanion(UserEntity user) {
    return UserTableDriftCompanion(
      // id: Value(user.id),
      name: Value(user.name),
      hashedPassword: Value(user.hashedPassword),
      email: Value(user.email),
      createdDate: Value(user.createdDate),
    );
  }
}
