import 'package:drift/drift.dart';
import 'package:fo_fe/core/db/drift/organizer_drift_exports.dart';
import 'package:fo_fe/features/organizer/items/organizer_item/config/organizer_item_export.dart';
import 'package:fo_fe/features/organizer/items/user/config/user_exports.dart';

class UserMapper {
  static UserEntity entityFromTableDrift(UserTableDriftG user) {
    return UserEntity(
      id: user.id,
      name: user.name,
      password: user.hashedPassword,
      email: user.email,
      createdDate: user.createdDate,
    );
  }

  static OrganizerItems<UserEntity> entityItemsFromTableDriftItems(
      List<UserTableDriftG> items) {
    return OrganizerItems.of(items.map(entityFromTableDrift).toList());
  }

  static UserTableDriftCompanion tableDriftCompanionFromModel(UserEntity user) {
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
      creatorId: Value(user.creatorId),
    );
  }

  static UserTableDriftCompanion entityToCompanion(UserEntity user) {
    return UserTableDriftCompanion(
      id: Value(user.id),
      name: Value(user.name),
      hashedPassword: Value(user.hashedPassword),
      email: Value(user.email),
      createdDate: Value(user.createdDate),
      creatorId: Value(user.creatorId),
    );
  }
}
