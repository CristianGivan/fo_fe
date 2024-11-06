import 'package:drift/drift.dart';
import 'package:fo_fe/core/db/drift/organizer_drift_exports.dart';
import 'package:fo_fe/features/organizer/items/user/utils/user_exports.dart';
import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';

class UserMapper {
  static UserEntity entityFromTableDrift(UserTableDriftG user) {
    return UserEntity(
      id: user.id,
      name: user.name,
      password: user.hashedPassword,
      email: user.email,
      createdDate: user.createdDate,
      userType: userTypeMap[user.userType]!,
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
      userType: Value(userTypeEnumToStringMap[user.userType]!),
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
      userType: Value(userTypeEnumToStringMap[user.userType]!),
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
      userType: Value(userTypeEnumToStringMap[user.userType]!),
    );
  }
}
