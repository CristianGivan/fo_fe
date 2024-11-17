import 'package:dartz/dartz.dart';
import 'package:fo_fe/core/error/failures.dart';
import 'package:fo_fe/core/usecase/usecase.dart';
import 'package:fo_fe/features/authentication/utils/auth_exports.dart';
import 'package:fo_fe/features/authentication/utils/other/auth_params.dart';

class SignOutUseCase extends UseCase<void, AuthParams> {
  final AuthRepository authRepository;

  SignOutUseCase(this.authRepository);

  @override
  @override
  Future<Either<Failure, void>> call(AuthParams params) async {
    final result = await authRepository.getActiveAuthForDeviceInfo();
    return await result.fold(
      (failure) async => Left(failure),
      (auth) async => await authRepository.signOut(auth.id),
    );
  }
}
