import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:fo_fe/core/error/failures.dart';
import 'package:fo_fe/core/usecase/usecase.dart';
import 'package:fo_fe/features/organizer/items/user/utils/user_exports.dart';

class AddUserToUserUseCase extends UseCase<int, AddUserToUserParams> {
  final UserRepository repository;

  AddUserToUserUseCase(this.repository);

  @override
  Future<Either<Failure, int>> call(AddUserToUserParams params) async {
    final addedUser = await repository.addUser(params.userLinked);
    return addedUser.fold(
      (failure) => const Left(UserNotAddedFailure('Failed to add user')),
      (addedUser) async {
        return repository.addUserToUser(
          addedUser.id,
          params.authUserId,
          addedUser.name,
          UserStatus.Pending,
        );
      },
    );
  }
}

class AddUserToUserParams extends Equatable {
  final UserEntity userLinked;
  final int authUserId;

  const AddUserToUserParams({required this.userLinked, required this.authUserId});

  @override
  List<Object> get props => [userLinked, authUserId];
}
