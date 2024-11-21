import 'package:dartz/dartz.dart';
import 'package:fo_fe/core/error/failures.dart';
import 'package:fo_fe/core/usecase/usecase.dart';
import 'package:fo_fe/features/organizer/items/user/utils/user_exports.dart';
import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';

class GetUserItemsByUserId extends UseCase<OrganizerItems<UserEntity>, UserParams> {
  final UserRepository userRepository;

  GetUserItemsByUserId(this.userRepository);

  @override
  Future<Either<Failure, OrganizerItems<UserEntity>>> call(UserParams params) async {
    return await userRepository.getConnectedUserItemsByUserId(params.userId);
  }
}
