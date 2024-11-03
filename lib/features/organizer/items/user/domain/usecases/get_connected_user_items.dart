import 'package:dartz/dartz.dart';
import 'package:fo_fe/core/error/failures.dart';
import 'package:fo_fe/core/usecase/params.dart';
import 'package:fo_fe/core/usecase/usecase.dart';
import 'package:fo_fe/features/authentication/domain/repositories/authentication_repository.dart';
import 'package:fo_fe/features/organizer/items/user/utils/user_exports.dart';
import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';

class GetConnectedUserItems extends UseCase<OrganizerItems<UserEntity>, NoParams> {
  final UserRepository repository;
  final AuthenticationRepository authenticationRepository;

  GetConnectedUserItems(this.repository, this.authenticationRepository);

  @override
  Future<Either<Failure, OrganizerItems<UserEntity>>> call(NoParams params) async {
    final result = await authenticationRepository.getActiveAuthenticationForDeviceInfo();
    return result.fold((failure) => Left(failure),
        (auth) async => repository.getConnectedUserItemsByUserId(auth.userId));
  }
}
