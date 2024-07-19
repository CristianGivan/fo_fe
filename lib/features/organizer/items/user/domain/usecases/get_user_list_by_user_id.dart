import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:fo_fe/core/error/failures.dart';
import 'package:fo_fe/core/usecase/usecase.dart';
import 'package:fo_fe/core/util/organizer/core_util_organizer.dart';
import 'package:fo_fe/features/organizer/items/user/user_exports.dart';

class GetUserItemsByUserId
    extends UseCase<OrganizerItems<UserEntity>, GetUserItemsByUserIdParams> {
  final UserRepository repository;

  GetUserItemsByUserId(this.repository);

  @override
  Future<Either<Failure, OrganizerItems<UserEntity>>> call(
      GetUserItemsByUserIdParams params) {
    return repository.getUserItemsByUserId(params.userId);
  }
}

class GetUserItemsByUserIdParams extends Equatable {
  final int userId;

  GetUserItemsByUserIdParams({required this.userId});

  @override
  List<Object> get props => [userId];
}
