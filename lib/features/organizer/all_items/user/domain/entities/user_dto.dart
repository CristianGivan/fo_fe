import 'package:fo_fe/features/organizer/all_items/user/domain/entities/user_entity.dart';
import 'package:fo_fe/features/organizer/all_items/user/domain/entities/user_user_entity.dart';
import 'package:fo_fe/features/organizer/domain/entities/dto_entity.dart';

class UserDto extends DtoEntity {
  final UserEntity user;
  final UserUserLinkEntity userUserLink;

  UserDto({
    required this.user,
    required this.userUserLink,
  }) : super(
          entity: user,
          userLink: userUserLink,
        );

  UserDto copyWith({
    UserEntity? user,
    UserUserLinkEntity? userUserLink,
  }) {
    return UserDto(
      user: user ?? this.user,
      userUserLink: userUserLink ?? this.userUserLink,
    );
  }

  @override
  // TODO: implement isEmpty
  bool get isEmpty => throw UnimplementedError();

  @override
  List<Object?> get props => [user, userUserLink];
}
