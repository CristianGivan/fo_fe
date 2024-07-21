import 'package:equatable/equatable.dart';
import 'package:fo_fe/core/db/encrypt/hashing_service.dart';
import 'package:fo_fe/features/organizer/items/organizer_item/organizer_item.dart';

import '../../../../../../core/const/constants.dart';

class UserEntity extends OrganizerItemEntity with EquatableMixin {
  final String _name;
  final String _hashedPassword;
  final String _email;

  UserEntity({
    int? id,
    required String name,
    String? email,
    DateTime? createdDate,
    String? password,
  })  : _name = name,
        _email = email ?? "",
        _hashedPassword = HashingService.hashPassword(password ?? name),
        super(
          id: id ?? 0,
          createdDate: createdDate ?? INITIAL_EPOCH_DATE,
        );

  factory UserEntity.empty() => UserEntity(name: "", email: "", password: "");

  String get name => _name;

  String get email => _email;

  String get hashedPassword => _hashedPassword;

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
