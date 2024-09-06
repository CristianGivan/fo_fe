import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:fo_fe/core/error/failures.dart';
import 'package:fo_fe/core/usecase/usecase.dart';
import 'package:fo_fe/core/utils/core_utils_exports.dart';
import 'package:fo_fe/features/authentication/config/authentication_exports.dart';
import 'package:fo_fe/features/organizer/items/user/config/user_exports.dart';

class LoginUseCase extends UseCase<AuthenticationEntity, LoginParams> {
  final AuthenticationRepository authRepository;
  final UserRepository userRepository;

  LoginUseCase(this.authRepository, this.userRepository);

  @override
  Future<Either<Failure, AuthenticationEntity>> call(LoginParams params) async {
    if (!isValidEmail(params.email) || !isValidPassword(params.password)) {
      return const Left(InvalidInputFailure("InvalidInputFailure"));
    }

    // Fetch user by email and password

    final hashingPassword = HashingService.hashPassword(params.password);
    final userResult = await userRepository.getUserByEmailAndPassword(
        params.email, hashingPassword);
    return userResult.fold(
      (failure) => Left(failure),
      (user) async {
        return await authRepository.insertAuthentication(user);
      },
    );
  }

  bool isValidEmail(String email) {
    return email.contains('@');
  }

  bool isValidPassword(String password) {
    return password.length >= 8;
  }
}

class LoginParams extends Equatable {
  final String email;
  final String password;

  const LoginParams({
    required this.email,
    required this.password,
  });

  @override
  List<Object?> get props => [email, password];
}
