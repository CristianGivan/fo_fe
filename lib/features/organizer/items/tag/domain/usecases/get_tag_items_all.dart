import 'package:dartz/dartz.dart';
import 'package:fo_fe/core/error/failures.dart';
import 'package:fo_fe/core/usecase/usecase.dart';
import 'package:fo_fe/core/util/organizer/core_util_organizer.dart';
import 'package:fo_fe/features/organizer/items/tag/domain/entities/tag_entity.dart';
import 'package:fo_fe/features/organizer/items/tag/domain/repositories/tag_repository.dart';

class GetTagItemsAll extends UseCase<OrganizerItems<TagEntity>, NoParams> {
  final TagRepository repository;

  GetTagItemsAll(this.repository);

  @override
  Future<Either<Failure, OrganizerItems<TagEntity>>> call(
      NoParams params) async {
    return await repository.getTagItemsAll();
  }
}
