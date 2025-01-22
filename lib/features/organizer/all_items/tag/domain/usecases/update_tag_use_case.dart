import 'package:dartz/dartz.dart';
import 'package:fo_fe/core/error/failures.dart';
import 'package:fo_fe/core/usecase/usecase.dart';
import 'package:fo_fe/features/organizer/all_items/tag/domain/repositories/tag_repository.dart';
import 'package:fo_fe/features/organizer/all_items/tag/utils/other/tag_params.dart';

class UpdateTagUseCase extends UseCase<bool, TagParams> {
  final TagRepository repository;

  UpdateTagUseCase(this.repository);

  @override
  Future<Either<Failure, bool>> call(TagParams params) async {
    return await repository.updateTag(params.tagEntity);
  }
}
