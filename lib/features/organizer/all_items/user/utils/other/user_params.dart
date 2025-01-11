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
    super.id = 0,
    UserEntity? user,
    this.userId = 0,
    super.idSet,
    this.name = '',
    this.email = '',
    this.password = '',
    this.userType = UserTypeEnum.Temporary,
    this.isEmailVerified = false,
  })  : user = user ?? UserEntity.empty(),
        super(itemType: ItemsTypeEnum.user);

  @override
  List<Object> get props {
    return [id, user, userId, name, email, password, userType, isEmailVerified, ...super.props];
  }
}
