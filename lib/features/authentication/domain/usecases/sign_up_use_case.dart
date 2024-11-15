import 'package:dartz/dartz.dart';
import 'package:fo_fe/core/error/failures.dart';
import 'package:fo_fe/core/usecase/usecase.dart';
import 'package:fo_fe/features/authentication/utils/authentication_exports.dart';
import 'package:fo_fe/features/organizer/items/user/utils/user_exports.dart';

class SignUpUseCase extends UseCase<AuthenticationEntity, UserParams> {
  final AuthenticationRepository authRepository;
  final UserRepository userRepository;

  SignUpUseCase(this.authRepository, this.userRepository);

  @override
  Future<Either<Failure, AuthenticationEntity>> call(UserParams params) async {
    final userIdResult = await userRepository.addUser(params.user);
    return userIdResult.fold(
      (failure) => Left(failure),
      (userId) async {
        final authResult = await authRepository.addAuthentication(userId);
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
