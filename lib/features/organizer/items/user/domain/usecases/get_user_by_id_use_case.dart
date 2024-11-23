import 'package:dartz/dartz.dart';
import 'package:fo_fe/core/error/failures.dart';
import 'package:fo_fe/core/usecase/usecase.dart';
import 'package:fo_fe/features/organizer/items/user/utils/user_exports.dart';

class GetUserByIdUseCase extends UseCase<UserEntity, UserParams> {
  final UserRepository repository;

  GetUserByIdUseCase(this.repository);

  @override
  Future<Either<Failure, UserEntity>> call(UserParams params) {
    return repository.getUserById(params.userId);
  }
}
