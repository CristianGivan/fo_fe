import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:fo_fe/core/error/failures.dart';
import 'package:fo_fe/core/usecase/usecase.dart';
import 'package:fo_fe/features/authentication/authentication_exports.dart';

class AutoLoginUseCase extends UseCase<AuthenticationEntity, AutoLoginParams> {
  final AuthenticationRepository authRepository;

  AutoLoginUseCase(this.authRepository);

  @override
  Future<Either<Failure, AuthenticationEntity>> call(
      AutoLoginParams params) async {
    final result = await authRepository
        .getActiveAuthenticationForDeviceInfo(params.deviceInfo);

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

class AutoLoginParams extends Equatable {
  final String deviceInfo;

  AutoLoginParams({
    required this.deviceInfo,
  });

  @override
  List<Object?> get props => [deviceInfo];
}
