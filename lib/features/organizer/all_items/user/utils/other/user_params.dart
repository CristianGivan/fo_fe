import 'package:fo_fe/features/organizer/all_items/user/utils/user_exports.dart';
import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';

class UserParams extends ItemParams {
  final UserEntity user;
  final int userId;
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
  }) : user = user ?? UserEntity.empty();

  @override
  List<Object> get props {
    return [user, userId, name, email, password, userType, isEmailVerified, ...super.props];
  }
}
