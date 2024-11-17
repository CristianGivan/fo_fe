import 'package:dartz/dartz.dart';
import 'package:fo_fe/core/error/failures.dart';
import 'package:fo_fe/core/usecase/usecase.dart';
import 'package:fo_fe/features/authentication/utils/auth_exports.dart';
import 'package:fo_fe/features/authentication/utils/other/auth_params.dart';
import 'package:fo_fe/features/organizer/items/user/utils/user_exports.dart';

class SignUpUseCase extends UseCase<AuthEntity, AuthSignUpParams> {
  final AuthRepository authRepository;
  final UserRepository userRepository;

  SignUpUseCase(this.authRepository, this.userRepository);

  @override
  Future<Either<Failure, AuthEntity>> call(AuthSignUpParams params) async {
    final userIdResult = await userRepository.addUser(params.user);
    return userIdResult.fold(
      (failure) => Left(failure),
      (user) async => await _handleAuth(user.id, params.isAutoSignIn),
    );
  }

// todo not eliminating duplicate auth

  Future<Either<Failure, AuthEntity>> _handleAuth(int userId, bool isAutoSignIn) async {
    final existingAuthResult = await authRepository.getAuthForUserAndDeviceInfo(userId);
    return existingAuthResult.fold(
      (failure) async => Left(failure),
      (existingAuthResult) async {
        if (existingAuthResult.isEmpty()) {
          return await _addNewAuth(userId, isAutoSignIn);
        } else {
          return await _updateExistingAuth(existingAuthResult, isAutoSignIn);
        }
      },
    );
  }

  Future<Either<Failure, AuthEntity>> _addNewAuth(int userId, bool isAutoSignIn) async {
    final newAuthResult = await authRepository.addAuthWithUserIdAndAutoSingIn(userId, isAutoSignIn);
    return newAuthResult.fold(
      (failure) async {
        await userRepository.deleteUser(userId);
        return Left(failure);
      },
      (authEntity) => Right(authEntity),
    );
  }

  Future<Either<Failure, AuthEntity>> _updateExistingAuth(
      AuthEntity existingAuth, bool isAutoSignIn) async {
    final updatedAuthResult =
        await authRepository.updateAuth(existingAuth.copyWith(isAutoSignIn: isAutoSignIn));
    return updatedAuthResult.fold(
      (failure) async {
        await userRepository.deleteUser(existingAuth.userId);
        return Left(failure);
      },
      (updatedAuth) => Right(updatedAuth),
    );
  }
}
