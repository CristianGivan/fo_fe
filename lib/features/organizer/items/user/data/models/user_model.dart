import 'package:equatable/equatable.dart';
import 'package:fo_fe/features/organizer/items/user/domain/entities/user_entity.dart';

import '../../../../../../core/const/constants.dart';

class UserModel extends UserEntity with EquatableMixin {
  UserModel({
    required int super.id,
    required super.name,
    required super.email,
    required super.createdDate,
    required String hashedPassword,
  }) : super(
            password: hashedPassword);

  factory UserModel.empty() => UserModel(
        id: 0,
        name: "",
        hashedPassword: "",
        email: "",
        createdDate: INITIAL_EPOCH_DATE,
      );

  @override
  List<Object?> get props => [id, name, email, hashedPassword];

  // You can also override toString if needed for better logging/debugging:
  @override
  String toString() {
    return 'UserModel{id: $id, name: $name, email: $email, hashedPassword: $hashedPassword}';
  }
}
