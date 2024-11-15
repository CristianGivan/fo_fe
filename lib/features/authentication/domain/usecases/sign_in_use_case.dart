import 'package:dartz/dartz.dart';
import 'package:fo_fe/core/error/failures.dart';
import 'package:fo_fe/core/usecase/usecase.dart';
import 'package:fo_fe/core/utils/exports/core_utils_exports.dart';
import 'package:fo_fe/features/authentication/utils/authentication_exports.dart';
import 'package:fo_fe/features/organizer/items/user/utils/other/user_validation.dart';
import 'package:fo_fe/features/organizer/items/user/utils/user_exports.dart';

class SigInUseCase extends UseCase<AuthenticationEntity, UserParams> {
  final AuthenticationRepository authRepository;
  final UserRepository userRepository;

  SigInUseCase(this.authRepository, this.userRepository);

  @override
  Future<Either<Failure, AuthenticationEntity>> call(UserParams params) async {
    final Either<Failure, UserEntity> userResult;
    if (UserValidation.isEmailValid(params.email) &&
        UserValidation.isPasswordValid(params.password)) {
      final hashingPassword = HashingService.hashPassword(params.password);
      userResult = await userRepository.getUserByEmailAndPassword(params.email, hashingPassword);
    } else if (params.user != UserEntity.empty()) {
      userResult = Right(params.user);
    } else {
      return const Left(InvalidInputFailure("InvalidInputFailure"));
    }

    return userResult.fold(
      (failure) => Left(failure),
      (user) async {
        return await authRepository.addAuthentication(user.id);
      },
    );
  }
}
