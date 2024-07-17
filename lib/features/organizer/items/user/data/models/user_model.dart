import 'package:equatable/equatable.dart';
import 'package:fo_fe/features/organizer/items/user/domain/entities/user_entity.dart';

import '../../../../../../core/const/constants.dart';

class UserModel extends UserEntity with EquatableMixin {
  UserModel({
    required int id,
    required String name,
    required String? email,
    required DateTime? createdDate,
    required String hashedPassword,
  }) : super(
            id: id,
            name: name,
            hashedPassword: hashedPassword,
            email: email,
            createdDate: createdDate);

  factory UserModel.empty() => UserModel(
        id: 0,
        name: "",
        hashedPassword: "",
        email: "",
        createdDate: INITIAL_EPOCH_DATE,
      );

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
