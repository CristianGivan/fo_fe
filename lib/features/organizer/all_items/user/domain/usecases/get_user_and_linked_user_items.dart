import 'package:dartz/dartz.dart';
import 'package:fo_fe/core/error/failures.dart';
import 'package:fo_fe/core/usecase/usecase.dart';
import 'package:fo_fe/features/authentication/domain/repositories/auth_repository.dart';
import 'package:fo_fe/features/organizer/all_items/user/utils/user_exports.dart';
import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';

class GetUserLinkedUserItems extends UseCase<OrganizerItems<UserEntity>, UserParams> {
  final UserRepository userRepository;
  final AuthRepository authRepository;

  GetUserLinkedUserItems(this.userRepository, this.authRepository);

  @override
  Future<Either<Failure, OrganizerItems<UserEntity>>> call(UserParams params) async {
    final loginUser = await userRepository.getUserById(params.userId);
    final allUserItemsLinkedResult =
        await userRepository.getPendingAndAcceptedUserItems(params.userId);

    return loginUser.fold(
      (failure) => Left(failure),
      (loginUser) async => await _getLinkedUserItems(loginUser, allUserItemsLinkedResult),
    );
  }

  Future<Either<Failure, OrganizerItems<UserEntity>>> _getLinkedUserItems(UserEntity loginUser,
      Either<Failure, OrganizerItems<UserEntity>> allUserItemsLinkedResult) async {
    return allUserItemsLinkedResult.fold(
      (failure) => Left(failure),
      (allUserItemsConnected) {
        OrganizerItemsBuilder<UserEntity> userList =
            OrganizerItemsBuilder<UserEntity>.of([loginUser]);
        userList.addAll(allUserItemsConnected);
        return Right(userList.build());
      },
    );
  }
}
