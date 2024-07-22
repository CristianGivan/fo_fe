import 'package:dartz/dartz.dart';
import 'package:fo_fe/core/error/failures.dart';
import 'package:fo_fe/core/usecase/usecase.dart';
import 'package:fo_fe/core/util/organizer/core_util_organizer.dart';
import 'package:fo_fe/features/authentication/authentication_exports.dart';

class GetLoggedInUserIdUseCase extends UseCase<int, NoParams> {
  final AuthenticationRepository authRepository;

  GetLoggedInUserIdUseCase(this.authRepository);

  @override
  Future<Either<Failure, int>> call(NoParams params) async {
    final result = await authRepository.getActiveAuthenticationForDeviceInfo();
    return result.fold(
      (failure) => Left(failure),
      (auth) async {
        return Right(auth.userId);
      },
    );
  }
}
