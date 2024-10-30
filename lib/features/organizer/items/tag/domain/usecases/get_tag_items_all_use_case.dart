import 'package:dartz/dartz.dart';
import 'package:fo_fe/core/error/failures.dart';
import 'package:fo_fe/core/usecase/params.dart';
import 'package:fo_fe/core/usecase/usecase.dart';
import 'package:fo_fe/features/organizer/items/tag/domain/entities/tag_entity.dart';
import 'package:fo_fe/features/organizer/items/tag/domain/repositories/tag_repository.dart';
import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';

class GetTagItemsAllUseCase extends UseCase<OrganizerItems<TagEntity>, NoParams> {
  final TagRepository repository;

  GetTagItemsAllUseCase(this.repository);

  @override
  Future<Either<Failure, OrganizerItems<TagEntity>>> call(NoParams params) async {
    return await repository.getTagItemsAll();
  }
}
