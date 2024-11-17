import 'package:dartz/dartz.dart';
import 'package:fo_fe/core/usecase/usecase.dart';
import 'package:fo_fe/features/authentication/utils/auth_exports.dart';
import 'package:fo_fe/features/authentication/utils/other/auth_params.dart';

import '../../../../core/error/failures.dart';

class SwitchUserUseCase extends UseCase<AuthEntity, AuthParams> {
  final AuthRepository authRepository;

  SwitchUserUseCase(this.authRepository);

  @override
  Future<Either<Failure, AuthEntity>> call(AuthParams params) async {
    final currentAuthResult = await authRepository.getLatestActiveAuthForDeviceInfo();

    await currentAuthResult.fold(
      (failure) => null,
      (auth) async {
        await authRepository.updateAuth(auth.copyWith(isActive: false));
      },
    );

    final authItemsResult = await authRepository.getAuthItemsForDeviceInfo();

    return authItemsResult.fold((failure) => Left(failure), (auths) async {
      final newAuth = auths.firstWhere((auth) => auth.userId == params.userId,
          orElse: () => throw const UserNotFoundFailure("UserNotFoundFailure"));

      final updatedAuth = newAuth.copyWith(
        usedCount: newAuth.usedCount + 1,
        lastUsedDate: DateTime.now(),
      );
      await authRepository.updateAuth(updatedAuth);
      return Right(updatedAuth);
    });
  }
}
