import 'package:dartz/dartz.dart';
import 'package:fo_fe/core/error/failures.dart';
import 'package:fo_fe/core/usecase/usecase.dart';
import 'package:fo_fe/features/organizer/items/user/utils/parameters/user_params.dart';
import 'package:fo_fe/features/organizer/items/user/utils/user_exports.dart';
import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';

class GetUserItemsByUserId extends UseCase<OrganizerItems<UserEntity>, UserParams> {
  final UserRepository repository;

  GetUserItemsByUserId(this.repository);

  @override
  Future<Either<Failure, OrganizerItems<UserEntity>>> call(UserParams params) {
    return repository.getConnectedUserItemsByUserId(params.userId);
  }
}
