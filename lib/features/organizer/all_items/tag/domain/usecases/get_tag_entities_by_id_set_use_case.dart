import 'package:dartz/dartz.dart';
import 'package:fo_fe/core/error/failures.dart';
import 'package:fo_fe/core/usecase/usecase.dart';
import 'package:fo_fe/features/organizer/all_items/tag/domain/entities/tag_entity.dart';
import 'package:fo_fe/features/organizer/all_items/tag/domain/repositories/tag_repository.dart';
import 'package:fo_fe/features/organizer/all_items/tag/utils/other/tag_params.dart';
import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';

class GetTagEntitiesByIdSetUseCase extends UseCase<OrganizerItems<TagEntity>, TagParams> {
  final TagRepository repository;

  GetTagEntitiesByIdSetUseCase(this.repository);

  @override
  Future<Either<Failure, OrganizerItems<TagEntity>>> call(TagParams params) async {
    return await repository.getTagItemsByIdSet(params.idSet);
  }
}
