import 'package:dartz/dartz.dart';
import 'package:fo_fe/core/error/failures.dart';
import 'package:fo_fe/core/usecase/usecase.dart';
import 'package:fo_fe/features/organizer/items/tag/domain/entities/tag_entity.dart';
import 'package:fo_fe/features/organizer/items/tag/domain/repositories/tag_repository.dart';
import 'package:fo_fe/features/organizer/items/tag/utils/parameters/tag_params.dart';
import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';

class GetTagItemsByIdSetUseCase extends UseCase<OrganizerItems<TagEntity>, TagParams> {
  final TagRepository repository;

  GetTagItemsByIdSetUseCase(this.repository);

  @override
  Future<Either<Failure, OrganizerItems<TagEntity>>> call(TagParams params) async {
    return await repository.getTagItemsByIdSet(params.idSet);
  }
}
