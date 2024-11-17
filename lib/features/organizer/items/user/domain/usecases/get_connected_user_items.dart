import 'package:dartz/dartz.dart';
import 'package:fo_fe/core/error/failures.dart';
import 'package:fo_fe/core/usecase/params.dart';
import 'package:fo_fe/core/usecase/usecase.dart';
import 'package:fo_fe/features/authentication/domain/repositories/auth_repository.dart';
import 'package:fo_fe/features/organizer/items/user/utils/user_exports.dart';
import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';

class GetConnectedUserItems extends UseCase<OrganizerItems<UserEntity>, NoParams> {
  final UserRepository repository;
  final AuthRepository authRepository;

  GetConnectedUserItems(this.repository, this.authRepository);

  @override
  Future<Either<Failure, OrganizerItems<UserEntity>>> call(NoParams params) async {
    final result = await authRepository.getActiveAuthForDeviceInfo();
    return result.fold((failure) => Left(failure),
        (auth) async => repository.getConnectedUserItemsByUserId(auth.userId));
  }
}
