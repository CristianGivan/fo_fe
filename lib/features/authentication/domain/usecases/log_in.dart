import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:fo_fe/core/db/encrypt/hashing_service.dart';
import 'package:fo_fe/core/error/failures.dart';
import 'package:fo_fe/core/usecase/usecase.dart';
import 'package:fo_fe/features/authentication/authentication_exports.dart';
import 'package:fo_fe/features/organizer/items/user/user_exports.dart';

class LoginUseCase extends UseCase<AuthenticationEntity, LoginParams> {
  final AuthenticationRepository authRepository;
  final UserRepository userRepository;

  LoginUseCase(this.authRepository, this.userRepository);

  @override
  Future<Either<Failure, AuthenticationEntity>> call(LoginParams params) async {
    if (!isValidEmail(params.email) || !isValidPassword(params.password)) {
      return Left(InvalidInputFailure("InvalidInputFailure"));
    }

    // Fetch user by email and password

    final hashingPassword = HashingService.hashPassword(params.password);
    final userResult = await userRepository.getUserByEmailAndPassword(
        params.email, hashingPassword);
    return userResult.fold(
      (failure) => Left(failure),
      (user) async {
        if (user == null) {
          return Left(InvalidInputFailure("Invalid email or password"));
        }

        // Proceed with authentication
        return await authRepository.login(user, params.deviceInfo);
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
  final String deviceInfo;

  LoginParams({
    required this.email,
    required this.password,
    required this.deviceInfo,
  });

  @override
  List<Object?> get props => [email, password, deviceInfo];
}
