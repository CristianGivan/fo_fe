import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:fo_fe/core/error/failures.dart';
import 'package:fo_fe/core/usecase/usecase.dart';
import 'package:fo_fe/core/util/organizer/core_util_organizer.dart';
import 'package:fo_fe/features/organizer/items/tag/domain/entities/tag_entity.dart';
import 'package:fo_fe/features/organizer/items/tag/domain/repositories/tag_repository.dart';

class GetTagItemsByIdSet
    extends UseCase<OrganizerItems<TagEntity>, IdSetParams> {
  final TagRepository repository;

  GetTagItemsByIdSet(this.repository);

  @override
  Future<Either<Failure, OrganizerItems<TagEntity>>> call(
      IdSetParams params) async {
    return await repository.getTagItemsByIdSet(params.idSet);
  }
}

class IdSetParams extends Equatable {
  final IdSet idSet;

  IdSetParams({required this.idSet});

  @override
  List<Object?> get props => [idSet];
}
