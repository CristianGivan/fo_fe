import 'package:dartz/dartz.dart';
import 'package:fo_fe/core/error/failures.dart';
import 'package:fo_fe/core/usecase/params.dart';
import 'package:fo_fe/core/usecase/usecase.dart';
import 'package:fo_fe/features/authentication/utils/auth_exports.dart';

class SignInAutoUseCase extends UseCase<AuthEntity, NoParams> {
  final AuthRepository authRepository;

  SignInAutoUseCase(this.authRepository);

  @override
  Future<Either<Failure, AuthEntity>> call(NoParams params) async {
    final result = await authRepository.getActiveAuthForDeviceInfo();

    return result.fold(
      (failure) => Left(failure),
      (auth) async {
        if (auth.isTokenExpired()) {
          // todo -delete- return await authRepository.refreshToken(auth.id);
          return Right(AuthEntity.empty());
        } else {
          // todo -improve- in case of fail of update
          await authRepository.updateAuth(
              auth.copyWith(usedCount: auth.usedCount + 1, lastUsedDate: DateTime.now()));
          return Right(auth);
        }
      },
    );
  }
}
