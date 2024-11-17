import 'package:dartz/dartz.dart';
import 'package:fo_fe/core/error/failures.dart';
import 'package:fo_fe/core/usecase/usecase.dart';
import 'package:fo_fe/features/authentication/utils/auth_exports.dart';
import 'package:fo_fe/features/organizer/items/user/utils/user_exports.dart';

class SignUpUseCase extends UseCase<AuthEntity, UserParams> {
  final AuthRepository authRepository;
  final UserRepository userRepository;

  SignUpUseCase(this.authRepository, this.userRepository);

  @override
  Future<Either<Failure, AuthEntity>> call(UserParams params) async {
    final userId = await userRepository.addUser(params.user);
    return userId.fold(
      (failure) => Left(failure),
      (userId) async {
        final authResult = await authRepository.addAuth(userId);
        return authResult.fold(
          (failure) async {
            await userRepository.deleteUser(userId);
            return Left(failure);
          },
          (authEntity) => Right(authEntity),
        );
      },
    );
  }
}
