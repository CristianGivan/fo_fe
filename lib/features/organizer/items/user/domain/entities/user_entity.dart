import 'package:equatable/equatable.dart';
import 'package:fo_fe/core/utils/core_utils_exports.dart';
import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';

import '../../../../../../core/utils/date_time/date_time_constants.dart';

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
  List<Object?> get props => [id, name, email, hashedPassword];

  @override
  String toString() {
    return 'UserModel{id: $id, name: $name, email: $email, hashedPassword: $hashedPassword}';
  }
}
