import 'package:dartz/dartz.dart';
import 'package:fo_fe/core/error/failures.dart';
import 'package:fo_fe/core/usecase/usecase.dart';
import 'package:fo_fe/features/authentication/utils/auth_exports.dart';
import 'package:fo_fe/features/authentication/utils/other/auth_params.dart';
import 'package:fo_fe/features/organizer/items/user/utils/user_exports.dart';

class SignUpUseCase extends UseCase<AuthEntity, SignUpParams> {
  final AuthRepository authRepository;
  final UserRepository userRepository;

  SignUpUseCase(this.authRepository, this.userRepository);

  @override
  Future<Either<Failure, AuthEntity>> call(SignUpParams params) async {
    final userIdResult = await userRepository.addUser(params.user);
    return userIdResult.fold(
      (failure) => Left(failure),
      (user) async => await _addNewAuth(user.id, params.isAutoSignIn),
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
}
