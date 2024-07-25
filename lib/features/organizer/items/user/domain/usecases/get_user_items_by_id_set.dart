import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:fo_fe/core/error/failures.dart';
import 'package:fo_fe/core/usecase/usecase.dart';
import 'package:fo_fe/features/organizer/items/organizer_item/config/organizer_item_export.dart';
import 'package:fo_fe/features/organizer/items/user/config/user_exports.dart';

class GetUserItemsByIdSet
    extends UseCase<OrganizerItems<UserEntity>, GetUserItemsByIdSetParams> {
  final UserRepository repository;

  GetUserItemsByIdSet(this.repository);

  @override
  Future<Either<Failure, OrganizerItems<UserEntity>>> call(
      GetUserItemsByIdSetParams params) {
    return repository.getUserItemsByIdSet(params.idSet);
  }
}

class GetUserItemsByIdSetParams extends Equatable {
  final IdSet idSet;

  GetUserItemsByIdSetParams({required this.idSet});

  @override
  List<Object> get props => [idSet];
}
