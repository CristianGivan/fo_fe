import 'package:dartz/dartz.dart';
import 'package:fo_fe/core/error/failures.dart';
import 'package:fo_fe/core/usecase/usecase.dart';
import 'package:fo_fe/features/authentication/utils/auth_exports.dart';
import 'package:fo_fe/features/authentication/utils/other/auth_params.dart';

class LogOutUseCase extends UseCase<void, AuthParams> {
  final AuthRepository authRepository;

  LogOutUseCase(this.authRepository);

  @override
  @override
  Future<Either<Failure, void>> call(AuthParams params) async {
    final result = await authRepository.signOut(params.authId);
    return result.fold(
      (failure) => Left(failure),
      (success) async => Right(success),
    );
  }
}
