import 'package:fo_fe/features/authentication/domain/entities/authentication_entity.dart';
import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';

class AuthParams extends Equatable {
  final AuthenticationEntity auth;
  final int authId;
  final IdSet idSet;

  AuthParams({
    AuthenticationEntity? auth,
    this.authId = 0,
    IdSet? idSet,
  })  : auth = auth ?? AuthenticationEntity.empty(),
        idSet = idSet ?? IdSet.empty();

  @override
  List<Object?> get props => [auth, authId, idSet];
}
