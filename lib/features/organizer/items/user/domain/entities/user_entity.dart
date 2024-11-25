import 'package:fo_fe/core/utils/exports/core_utils_exports.dart';
import 'package:fo_fe/features/organizer/items/user/utils/user_exports.dart';
import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';

import '../../../../../../core/utils/date_time/date_time_constants.dart';

class UserEntity extends OrganizerItemEntity with EquatableMixin {
  final String name;
  final String email;
  final String password;
  final String hashedPassword;
  final UserTypeEnum userType;

  UserEntity({
    int? id,
    required this.name,
    String? email,
    String? password,
    String? hashedPassword,
    DateTime? createdDate,
    UserTypeEnum? userType,
  })  : email = email ?? "",
        password = password ?? "",
        hashedPassword =
            hashedPassword ?? (password == "" ? "" : HashingService.hashPassword(password ?? "")),
        //to receive hashed pasword if I create the user from DB
        userType = userType ?? UserTypeEnum.Temporary,
        super(
          id: id ?? 0,
          createdDate: createdDate ?? INITIAL_EPOCH_DATE,
        );

  factory UserEntity.empty() => UserEntity(name: "", email: "", password: "");

  bool get isEmpty => name.isEmpty && email.isEmpty && password.isEmpty;

  UserEntity copyWith({
    int? id,
    String? name,
    String? email,
    String? password,
    DateTime? createdDate,
    UserTypeEnum? userType,
  }) {
    return UserEntity(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
      createdDate: createdDate ?? this.createdDate,
      userType: userType ?? this.userType,
    );
  }

  @override
  List<Object?> get props => [id, name, email, userType, hashedPassword];

  @override
  String toString() {
    return 'UserModel{id: $id, name: $name, email: $email, userType: $userType}';
  }
}
