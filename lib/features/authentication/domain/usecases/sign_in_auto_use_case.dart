import 'package:dartz/dartz.dart';
import 'package:fo_fe/core/error/failures.dart';
import 'package:fo_fe/core/usecase/params.dart';
import 'package:fo_fe/core/usecase/usecase.dart';
import 'package:fo_fe/features/authentication/utils/authentication_exports.dart';

class SignInAutoUseCase extends UseCase<AuthenticationEntity, NoParams> {
  final AuthenticationRepository authRepository;

  SignInAutoUseCase(this.authRepository);

  @override
  Future<Either<Failure, AuthenticationEntity>> call(NoParams params) async {
    final result = await authRepository.getActiveAuthenticationForDeviceInfo();

    return result.fold(
      (failure) => Left(failure),
      (auth) async {
        if (isTokenExpired(auth)) {
          return await authRepository.refreshToken(auth.id);
        }
        return Right(auth);
      },
    );
  }

  bool isTokenExpired(AuthenticationEntity auth) {
    return auth.expiredDate.isBefore(DateTime.now());
  }
}
