import 'package:dartz/dartz.dart';
import 'package:fo_fe/core/error/failures.dart';
import 'package:fo_fe/core/usecase/usecase.dart';
import 'package:fo_fe/features/organizer/all_items/tag/domain/entities/tag_entity.dart';
import 'package:fo_fe/features/organizer/all_items/tag/domain/repositories/tag_repository.dart';
import 'package:fo_fe/features/organizer/all_items/tag/utils/other/tag_params.dart';

class GetTagByIdUseCase extends UseCase<TagEntity?, TagParams> {
  final TagRepository repository;

  GetTagByIdUseCase(this.repository);

  @override
  Future<Either<Failure, TagEntity?>> call(TagParams params) async {
    return await repository.getTagById(params.id);
  }
}
