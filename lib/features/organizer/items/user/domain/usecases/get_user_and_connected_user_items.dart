import 'package:dartz/dartz.dart';
import 'package:fo_fe/core/error/failures.dart';
import 'package:fo_fe/core/usecase/params.dart';
import 'package:fo_fe/core/usecase/usecase.dart';
import 'package:fo_fe/features/authentication/domain/repositories/auth_repository.dart';
import 'package:fo_fe/features/organizer/items/user/utils/user_exports.dart';
import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';

class GetConnectedUserItems extends UseCase<OrganizerItems<UserEntity>, NoParams> {
  final UserRepository userRepository;
  final AuthRepository authRepository;

  GetConnectedUserItems(this.userRepository, this.authRepository);

  @override
  Future<Either<Failure, OrganizerItems<UserEntity>>> call(NoParams params) async {
    final logInUserResult = await authRepository.getLatestActiveAuthForDeviceInfo();

    return logInUserResult.fold(
      (failure) => Left(failure),
      (auth) async {
        final userId = auth.userId;
        final logInUserResult = await userRepository.getUserById(userId);

        return logInUserResult.fold(
          (failure) => Left(failure),
          (logInUser) async {
            final allUserItemsConnectedResult =
                await userRepository.getConnectedUserItemsByUserId(userId);

            return allUserItemsConnectedResult.fold(
              (failure) => Left(failure),
              (allUserItemsConnected) {
                OrganizerItemsBuilder<UserEntity> userList =
                    OrganizerItemsBuilder<UserEntity>.of([logInUser]);
                userList.addAll(allUserItemsConnected);
                return Right(userList.build());
              },
            );
          },
        );
      },
    );
  }
}
