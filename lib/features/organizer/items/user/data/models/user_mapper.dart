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

  static UserModel modelFromEntity(UserEntity? user) {
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

  static OrganizerItems<UserModel> modelItemsFromEntityItems(
      OrganizerItems<UserEntity>? items) {
    if (items == null) {
      return OrganizerItems.empty();
    }
    return OrganizerItems.of(items.map(modelFromEntity).toList());
  }

  static UserEntity entityFromModel(UserModel user) {
    return UserEntity(
      id: user.id,
      name: user.name,
      hashedPassword: user.hashedPassword,
      email: user.email,
      createdDate: user.createdDate,
    );
  }

  static OrganizerItems<UserEntity> entityItemsFromModelItems(
      OrganizerItems<UserModel>? models) {
    if (models == null) {
      return OrganizerItems.empty();
    }
    return OrganizerItems.of(models.map(entityFromModel).toList());
  }

  static UserTableDriftCompanion tableDriftCompanionFromModel(UserModel user) {
    return UserTableDriftCompanion(
      id: Value(user.id),
      name: Value(user.name),
      hashedPassword: Value(user.hashedPassword),
      email: Value(user.email),
      createdDate: Value(user.createdDate),
    );
  }

  static UserTableDriftCompanion tableDriftCompanionFromEntity(
      UserEntity user) {
    return UserTableDriftCompanion(
      // id: Value(user.id),
      name: Value(user.name),
      hashedPassword: Value(user.hashedPassword),
      email: Value(user.email),
      createdDate: Value(user.createdDate),
    );
  }
}
