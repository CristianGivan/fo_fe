import 'package:fo_fe/features/organizer/all_items/user/domain/entities/user_entity.dart';
import 'package:fo_fe/features/organizer/all_items/user/domain/entities/user_user_entity.dart';
import 'package:fo_fe/features/organizer/domain/entities/dto_entity.dart';

class User extends DtoEntity {
  final UserEntity user;
  final UserUserLinkEntity userUserLink;

  User({
    required this.user,
    required this.userUserLink,
  }) : super(
          entity: user,
          userLink: userUserLink,
        );

  User copyWith({
    UserEntity? user,
    UserUserLinkEntity? userUserLink,
  }) {
    return User(
      user: user ?? this.user,
      userUserLink: userUserLink ?? this.userUserLink,
    );
  }

  @override
  List<Object?> get props => [user, userUserLink];
}
