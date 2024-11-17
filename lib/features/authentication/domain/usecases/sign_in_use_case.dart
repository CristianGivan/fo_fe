import 'package:dartz/dartz.dart';
import 'package:fo_fe/core/error/failures.dart';
import 'package:fo_fe/core/usecase/usecase.dart';
import 'package:fo_fe/core/utils/exports/core_utils_exports.dart';
import 'package:fo_fe/features/authentication/utils/auth_exports.dart';
import 'package:fo_fe/features/organizer/items/user/utils/other/user_validation.dart';
import 'package:fo_fe/features/organizer/items/user/utils/user_exports.dart';

class SigInUseCase extends UseCase<AuthEntity, UserParams> {
  final AuthRepository authRepository;
  final UserRepository userRepository;

  SigInUseCase(this.authRepository, this.userRepository);

  @override
  Future<Either<Failure, AuthEntity>> call(UserParams params) async {
    final Either<Failure, UserEntity> userResult = await _getUser(params);
    return userResult.fold(
      (failure) => Left(failure),
      //todo -update- add increment view
      (user) async => await _getAuthForUser(user),
    );
  }

  Future<Either<Failure, UserEntity>> _getUser(UserParams params) async {
    if (UserValidation.isEmailValid(params.email) &&
        UserValidation.isPasswordValid(params.password)) {
      final hashingPassword = HashingService.hashPassword(params.password);
      return await userRepository.getUserByEmailAndPassword(params.email, hashingPassword);
    } else if (params.user != UserEntity.empty()) {
      return Right(params.user);
    } else {
      return const Left(InvalidInputFailure("InvalidInputFailure"));
    }
  }

  Future<Either<Failure, AuthEntity>> _getAuthForUser(UserEntity user) async {
    final existingAuth = await authRepository.getAuthForUserAndDeviceInfo(user.id);
    if (existingAuth.isRight()) {
      // todo -improve- in case of fail of update
      return existingAuth.fold(
        (failure) => Left(failure),
        (auth) async {
          final updatedAuth = auth.copyWith(
            usedCount: auth.usedCount + 1,
            lastUsedDate: DateTime.now(),
            isActive: true,
          );
          await authRepository.updateAuth(updatedAuth);
          return Right(updatedAuth);
        },
      );
    } else {
      return await authRepository.addAuth(user.id);
    }
  }
}
