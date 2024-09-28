import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:fo_fe/core/error/failures.dart';
import 'package:fo_fe/core/usecase/usecase.dart';
import 'package:fo_fe/features/authentication/utils/authentication_exports.dart';

class LogoutUseCase extends UseCase<void, LogoutParams> {
  final AuthenticationRepository authRepository;

  LogoutUseCase(this.authRepository);

  @override
  @override
  Future<Either<Failure, void>> call(LogoutParams params) async {
    final result = await authRepository.getActiveAuthenticationForDeviceInfo();
    return await result.fold(
      (failure) async => Left(failure),
      (auth) async => await authRepository.logout(auth.id),
    );
  }
}

class LogoutParams extends Equatable {
  final int authId;

  const LogoutParams({required this.authId});

  @override
  List<Object?> get props => [authId];
}
