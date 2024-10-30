import 'package:dartz/dartz.dart';
import 'package:fo_fe/core/error/failures.dart';
import 'package:fo_fe/core/usecase/usecase.dart';
import 'package:fo_fe/features/organizer/items/tag/domain/repositories/tag_repository.dart';
import 'package:fo_fe/features/organizer/items/tag/utils/parameters/tag_params.dart';

class DeleteTagUseCase extends UseCase<int, TagParams> {
  final TagRepository repository;

  DeleteTagUseCase(this.repository);

  @override
  Future<Either<Failure, int>> call(TagParams params) async {
    return await repository.deleteTag(params.tagId);
  }
}
