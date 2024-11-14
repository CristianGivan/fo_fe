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
    await userRepository.addUser(params.user);
    return await authRepository.addAuthentication(params.user);
  }
}
