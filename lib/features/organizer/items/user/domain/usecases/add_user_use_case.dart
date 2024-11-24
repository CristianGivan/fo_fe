import 'package:dartz/dartz.dart';
import 'package:fo_fe/core/error/failures.dart';
import 'package:fo_fe/core/usecase/usecase.dart';
import 'package:fo_fe/features/organizer/items/user/utils/user_exports.dart';

class AddUserUseCase extends UseCase<UserEntity, UserParams> {
  final UserRepository repository;

  AddUserUseCase(this.repository);

  @override
  Future<Either<Failure, UserEntity>> call(UserParams params) async {
    final userIdResult = await repository.addUser(params.user);
    return userIdResult.fold(
      (failure) => Left(failure),
      (userId) => Right(userId),
    );
  }
}
