import 'package:drift/drift.dart';
import 'package:fo_fe/core/db/drift/organizer_drift_exports.dart';
import 'package:fo_fe/features/organizer/all_items/user/utils/user_exports.dart';
import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';

class UserMapper {
  static UserEntity entityFromTableDrift(UserTableDriftG user) {
    return UserEntity(
      id: user.id,
      name: user.name,
      hashedPassword: user.hashedPassword,
      email: user.email,
      createdDate: user.createdDate,
      userType: userTypeMap[user.userType]!,
    );
  }

  static OrganizerItems<UserEntity> entityItemsFromTableDriftItems(List<UserTableDriftG> items) {
    return OrganizerItems.of(items.map(entityFromTableDrift).toList());
  }

  static UserTableDriftCompanion tableDriftCompanionFromModel(UserEntity entity) {
    return UserTableDriftCompanion(
      id: Value(entity.id),
      name: Value(entity.name),
      hashedPassword: Value(entity.hashedPassword),
      email: Value(entity.email),
      createdDate: Value(entity.createdDate),
      userType: Value(userTypeMapToString[entity.userType]!),
    );
  }

  static UserTableDriftCompanion tableDriftCompanionFromEntity(UserEntity entity) {
    return UserTableDriftCompanion(
      // id: Value(user.id),
      name: Value(entity.name),
      hashedPassword: Value(entity.hashedPassword),
      email: Value(entity.email),
      createdDate: Value(entity.createdDate),
      creatorId: Value(entity.creatorId),
      userType: Value(userTypeMapToString[entity.userType]!),
    );
  }

  static UserTableDriftCompanion entityToCompanion(UserEntity entity) {
    return UserTableDriftCompanion(
      id: entity.id == 0 ? const Value.absent() : Value(entity.id),
      name: Value(entity.name),
      hashedPassword: Value(entity.hashedPassword),
      email: Value(entity.email),
      createdDate: Value(entity.createdDate),
      creatorId: Value(entity.creatorId),
      userType: Value(userTypeMapToString[entity.userType]!),
    );
  }

  // Method to map row data to UserTableDriftG
  static UserTableDriftG fromUserJoinUserUser(Map<String, dynamic> data, GeneratedDatabase db) {
    return UserTableDriftG(
      id: data['user_id_linked'] as int,
      name: data['user_name_linked'] as String,
      hashedPassword: data['hashed_password'] as String,
      email: data['email'] as String,
      createdDate: DateTime.fromMillisecondsSinceEpoch(data['created_date'] as int),
      userType: data['user_type'] as String,
      creatorId: data['creator_id'] as int,
    );
  }
}
