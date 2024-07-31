import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:fo_fe/core/error/failures.dart';
import 'package:fo_fe/core/usecase/usecase.dart';
import 'package:fo_fe/core/utils/core_utils_exports.dart';
import 'package:fo_fe/features/authentication/config/authentication_exports.dart';
import 'package:fo_fe/features/organizer/items/user/config/user_exports.dart';

class SignUpUseCase extends UseCase<AuthenticationEntity, SignUpParams> {
  final AuthenticationRepository authRepository;
  final UserRepository userRepository;

  SignUpUseCase(this.authRepository, this.userRepository);

  @override
  Future<Either<Failure, AuthenticationEntity>> call(
      SignUpParams params) async {
    if (!isValidEmail(params.email) || !isValidPassword(params.password)) {
      return Left(InvalidInputFailure("InvalidInputFailure"));
    }

    final hashingPassword = HashingService.hashPassword(params.password);
    final userResult = await userRepository.getUserByEmailAndPassword(
        params.email, hashingPassword);

    return userResult.fold(
      (failure) => Left(failure),
      (user) async {
        if (user.id == 0) {
          final insertResult = await userRepository.insertUser(UserEntity(
              name: params.name,
              email: params.email,
              password: hashingPassword));

          return insertResult.fold((failure) => Left(failure), (id) {
            final newUser = UserEntity(
                id: id,
                name: params.name,
                email: params.email,
                password: hashingPassword);
            return authRepository.insertAuthentication(newUser);
          });
        }

        // Proceed with authentication for existing user
        return authRepository.insertAuthentication(user);
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

class SignUpParams extends Equatable {
  final String name;
  final String email;
  final String password;

  SignUpParams({
    required this.name,
    required this.email,
    required this.password,
  });

  @override
  List<Object?> get props => [name, email, password];
}
