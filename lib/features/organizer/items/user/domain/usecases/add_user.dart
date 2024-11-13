import 'package:dartz/dartz.dart';
import 'package:fo_fe/core/error/failures.dart';
import 'package:fo_fe/core/usecase/usecase.dart';
import 'package:fo_fe/features/organizer/items/user/utils/user_exports.dart';

class AddUser extends UseCase<int, UserParams> {
  final UserRepository repository;

  AddUser(this.repository);

  @override
  Future<Either<Failure, int>> call(UserParams params) {
    return repository.addUser(params.user);
  }
}
