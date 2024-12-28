import 'package:fo_fe/features/organizer/all_items/user/utils/user_exports.dart';
import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';

class UserParams extends Equatable {
  final UserEntity user;
  final int userId;
  final IdSet idSet;
  final String name;
  final String email;
  final String password;
  final UserTypeEnum userType;
  final bool isEmailVerified;

  UserParams({
    UserEntity? user,
    this.userId = 0,
    IdSet? idSet,
    this.name = '',
    this.email = '',
    this.password = '',
    this.userType = UserTypeEnum.Temporary,
    this.isEmailVerified = false,
  })  : user = user ?? UserEntity.empty(),
        idSet = idSet ?? IdSet.empty();

  @override
  List<Object?> get props => [user, userId, idSet, email, password];
}
