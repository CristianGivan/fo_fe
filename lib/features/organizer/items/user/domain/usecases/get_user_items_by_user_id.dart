import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:fo_fe/core/error/failures.dart';
import 'package:fo_fe/core/usecase/usecase.dart';
import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';
import 'package:fo_fe/features/organizer/items/user/utils/user_exports.dart';

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

  const GetUserItemsByUserIdParams({required this.userId});

  @override
  List<Object> get props => [userId];
}
