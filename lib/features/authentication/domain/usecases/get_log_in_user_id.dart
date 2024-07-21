import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:fo_fe/core/error/failures.dart';
import 'package:fo_fe/core/usecase/usecase.dart';
import 'package:fo_fe/features/authentication/authentication_exports.dart';

class GetLoggedInUserIdUseCase extends UseCase<int, GetLoggedInUserParams> {
  final AuthenticationRepository authRepository;

  GetLoggedInUserIdUseCase(this.authRepository);

  @override
  Future<Either<Failure, int>> call(GetLoggedInUserParams params) async {
    final result = await authRepository
        .getActiveAuthenticationForDeviceInfo(params.deviceInfo);
    return result.fold(
      (failure) => Left(failure),
      (auth) async {
        return Right(auth.userId);
      },
    );
  }
}

class GetLoggedInUserParams extends Equatable {
  final String deviceInfo;

  GetLoggedInUserParams({required this.deviceInfo});

  @override
  List<Object?> get props => [deviceInfo];
}
