import 'package:drift/drift.dart';
import 'package:fo_fe/core/db/drift/organizer_drift_exports.dart';
import 'package:fo_fe/features/organizer/items/user/user_exports.dart';

class UserMapper {
  static UserModel toModel(UserTableDriftG userTable) {
    return UserModel(
      id: userTable.id,
      name: userTable.name,
      email: userTable.email,
    );
  }

  static UserModel entityToModel(UserEntity? userEntity) {
    if (userEntity == null) {
      return UserModel.empty();
    }
    return UserModel(
      id: userEntity.id,
      name: userEntity.name,
      email: userEntity.email,
    );
  }

  static List<UserModel> entityListToModelList(
      List<UserEntity>? userEntityList) {
    if (userEntityList == null) {
      return [];
    }
    return userEntityList.map(entityToModel).toList();
  }

  static UserModel fromTableDrift(UserTableDriftG user) {
    return UserModel(
      id: user.id,
      name: user.name,
      email: user.email,
    );
  }

  static UserEntity modelToEntity(UserModel model) {
    return UserEntity(
      id: model.id,
      name: model.name,
      email: model.email,
    );
  }

  static List<UserEntity> modelListToEntityList(List<UserModel>? models) {
    if (models == null) {
      return [];
    }
    return models.map(modelToEntity).toList();
  }

  static UserTableDriftCompanion toCompanion(UserModel user) {
    return UserTableDriftCompanion(
      id: Value(user.id),
      name: Value(user.name),
      email: Value(user.email),
    );
  }
}
