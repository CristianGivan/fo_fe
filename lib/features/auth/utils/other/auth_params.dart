import 'package:fo_fe/features/auth/domain/entities/auth_entity.dart';
import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';

class AuthParams extends Equatable {
  final AuthEntity auth;
  final int authId;
  final int userId;
  final IdSet idSet;

  AuthParams({
    AuthEntity? auth,
    this.authId = 0,
    this.userId = 0,
    IdSet? idSet,
  })  : auth = auth ?? AuthEntity.empty(),
        idSet = idSet ?? IdSet.empty();

  @override
  List<Object?> get props => [auth, authId, userId, idSet];
}
