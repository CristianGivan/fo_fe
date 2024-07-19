import 'package:dartz/dartz.dart';
import 'package:fo_fe/core/error/failures.dart';
import 'package:fo_fe/core/usecase/usecase.dart';
import 'package:fo_fe/core/util/organizer/core_util_organizer.dart';
import 'package:fo_fe/features/organizer/items/user/user_exports.dart';

class GetUserItemsAll extends UseCase<OrganizerItems<UserEntity>, NoParams> {
  final UserRepository repository;

  GetUserItemsAll(this.repository);

  @override
  Future<Either<Failure, OrganizerItems<UserEntity>>> call(NoParams params) {
    return repository.getUserItemsAll();
  }
}
