import 'package:dartz/dartz.dart';
import 'package:fo_fe/core/error/failures.dart';
import 'package:fo_fe/core/usecase/usecase.dart';
import 'package:fo_fe/features/authentication/domain/repositories/auth_repository.dart';
import 'package:fo_fe/features/organizer/all_items/user/utils/user_exports.dart';
import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';

class GetLinkedUserItems extends UseCase<OrganizerItems<UserEntity>, UserParams> {
  final UserRepository userRepository;
  final AuthRepository authRepository;

  GetLinkedUserItems(this.userRepository, this.authRepository);

  @override
  Future<Either<Failure, OrganizerItems<UserEntity>>> call(UserParams params) async {
    final allUserItemsLinkedResult =
        await userRepository.getPendingAndAcceptedUserItems(params.user.id);

    return allUserItemsLinkedResult.fold(
      (failure) => Left(failure),
      (allUserItemsConnected) {
        OrganizerItemsBuilder<UserEntity> userList =
            OrganizerItemsBuilder<UserEntity>.of([params.user]);
        userList.addAll(allUserItemsConnected);
        return Right(userList.build());
      },
    );
  }
}
