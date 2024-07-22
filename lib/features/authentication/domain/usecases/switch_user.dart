import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:fo_fe/core/usecase/usecase.dart';
import 'package:fo_fe/features/authentication/authentication_exports.dart';

import '../../../../core/error/failures.dart';

class SwitchUserUseCase
    extends UseCase<AuthenticationEntity, SwitchUserParams> {
  final AuthenticationRepository authRepository;

  SwitchUserUseCase(this.authRepository);

  @override
  Future<Either<Failure, AuthenticationEntity>> call(
      SwitchUserParams params) async {
    final currentAuthResult =
        await authRepository.getActiveAuthenticationForDeviceInfo();

    await currentAuthResult.fold((failure) => null, (auth) async {
      await authRepository.updateAuthentication(auth.copyWith(isActive: false));
    });

    final authsResult = await authRepository.getAuthenticationsForDeviceInfo();

    return authsResult.fold((failure) => Left(failure), (auths) async {
      final newAuth = auths.firstWhere((auth) => auth.userId == params.userId,
          orElse: () => throw UserNotFoundFailure("UserNotFoundFailure"));

      final updatedAuth =
          newAuth.copyWith(isActive: true, lastUsedDate: DateTime.now());
      await authRepository.updateAuthentication(updatedAuth);
      return Right(updatedAuth);
    });
  }
}

class SwitchUserParams extends Equatable {
  final int userId;

  SwitchUserParams({
    required this.userId,
  });

  @override
  List<Object> get props => [userId];
}
