import 'package:equatable/equatable.dart';
import 'package:fo_fe/features/organizer/items/user/domain/entities/user_entity.dart';

class UserModel extends UserEntity with EquatableMixin {
  UserModel({
    required int id,
    required String name,
    required String? email,
  }) : super(id: id, name: name, email: email);
  
  factory UserModel.empty() => UserModel(id: 0, name: "", email: "");

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
