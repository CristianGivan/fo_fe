import 'package:dartz/dartz.dart';
import 'package:fo_fe/core/error/failures.dart';
import 'package:fo_fe/core/usecase/params.dart';
import 'package:fo_fe/core/usecase/usecase.dart';
import 'package:fo_fe/features/authentication/utils/auth_exports.dart';

class GetSignInUserUseCase extends UseCase<int, NoParams> {
  final AuthRepository authRepository;

  GetSignInUserUseCase(this.authRepository);

  @override
  Future<Either<Failure, int>> call(NoParams params) async {
    final result = await authRepository.getActiveAuthForDeviceInfo();
    return result.fold(
      (failure) => Left(failure),
      (auth) async => Right(auth.userId),
    );
  }
}
