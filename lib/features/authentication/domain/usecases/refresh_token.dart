import 'package:dartz/dartz.dart';
import 'package:fo_fe/core/error/failures.dart';
import 'package:fo_fe/core/usecase/usecase.dart';
import 'package:fo_fe/features/authentication/utils/authentication_exports.dart';
import 'package:fo_fe/features/authentication/utils/other/auth_params.dart';

class RefreshTokenUseCase extends UseCase<AuthEntity, AuthParams> {
  final AuthRepository authRepository;

  RefreshTokenUseCase(this.authRepository);

  @override
  Future<Either<Failure, AuthEntity>> call(AuthParams params) async {
    return await authRepository.refreshToken(params.authId);
  }
}
