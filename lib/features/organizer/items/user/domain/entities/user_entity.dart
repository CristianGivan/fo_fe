import 'package:fo_fe/core/utils/exports/core_utils_exports.dart';
import 'package:fo_fe/features/organizer/items/user/utils/user_exports.dart';
import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';

import '../../../../../../core/utils/date_time/date_time_constants.dart';

class UserEntity extends OrganizerItemEntity with EquatableMixin {
  final String name;
  final String email;
  final String hashedPassword;
  final UserTypeEnum userType;

  UserEntity({
    int? id,
    required this.name,
    String? email,
    String? password,
    DateTime? createdDate,
    UserTypeEnum? userType,
  })  : email = email ?? "",
        hashedPassword = HashingService.hashPassword(password ?? name),
        userType = userType ?? UserTypeEnum.Local,
        super(
          id: id ?? 0,
          createdDate: createdDate ?? INITIAL_EPOCH_DATE,
        );

  factory UserEntity.empty() => UserEntity(name: "", email: "", password: "");

//todo -update- to uncased password
  String get password => HashingService.hashPassword(password);

  @override
  List<Object?> get props => [id, name, email, userType, hashedPassword];

  @override
  String toString() {
    return 'UserModel{id: $id, name: $name, email: $email, userType: $userType}';
  }
}
