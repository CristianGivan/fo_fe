import 'package:dartz/dartz.dart';
import 'package:fo_fe/core/usecase/usecase.dart';
import 'package:fo_fe/core/utils/exports/core_utils_exports.dart';
import 'package:fo_fe/features/authentication/utils/auth_exports.dart';
import 'package:fo_fe/features/organizer/all_items/user/utils/user_exports.dart';

class LogInUseCase extends UseCase<AuthEntity, UserParams> {
  final AuthRepository authRepository;
  final UserRepository userRepository;

  LogInUseCase(this.authRepository, this.userRepository);

  @override
  Future<Either<Failure, AuthEntity>> call(UserParams params) async {
    final hashingPassword = HashingService.hashPassword(params.password);
    final Either<Failure, UserEntity> userResult =
        await userRepository.getUserByEmailAndPassword(params.email, hashingPassword);
    return userResult.fold(
      (failure) => Left(failure),
      //todo -update- add increment view
      (user) async => await _getOrAddAuthForUser(user),
    );
  }

  Future<Either<Failure, AuthEntity>> _getOrAddAuthForUser(UserEntity user) async {
    if (user.isEmpty) {
      return _addAuthForUser(user.id);
    }

    final existingAuth = await authRepository.getAuthForUserAndDeviceInfo(user.id);
    return existingAuth.fold(
      (failure) => Left(failure),
      (auth) async => await _handleExistingAuth(auth, user.id),
    );
  }

  Future<Either<Failure, AuthEntity>> _handleExistingAuth(AuthEntity auth, int userId) async {
    if (auth.isEmpty) {
      return _addAuthForUser(userId);
    }

    if (auth.isTokenExpired()) {
      // TODO: Implement token refresh logic
      return Right(AuthEntity.empty());
    }

    return await _updateAuth(auth);
  }

  Future<Either<Failure, AuthEntity>> _addAuthForUser(int userId) {
    return authRepository.addAuthWithUserId(userId);
  }

  Future<Either<Failure, AuthEntity>> _updateAuth(AuthEntity auth) async {
    final updatedAuth = await authRepository.updateAuth(
      auth.copyWith(
        usedCount: auth.usedCount + 1,
        lastUsedDate: DateTime.now(),
      ),
    );

    return updatedAuth.fold(
      (failure) => Left(failure),
      (updatedAuth) => Right(updatedAuth),
    );
  }
}
