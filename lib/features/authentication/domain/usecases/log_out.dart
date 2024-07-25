import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:fo_fe/core/error/failures.dart';
import 'package:fo_fe/core/usecase/usecase.dart';
import 'package:fo_fe/features/authentication/config/authentication_exports.dart';

class LogoutUseCase extends UseCase<void, LogoutParams> {
  final AuthenticationRepository authRepository;

  LogoutUseCase(this.authRepository);

  @override
  Future<Either<Failure, void>> call(LogoutParams params) async {
    return await authRepository.logout(params.authId);
  }
}

class LogoutParams extends Equatable {
  final int authId;

  LogoutParams({required this.authId});

  @override
  List<Object?> get props => [authId];
}
