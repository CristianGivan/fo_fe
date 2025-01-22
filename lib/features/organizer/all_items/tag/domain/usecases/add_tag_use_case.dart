import 'package:dartz/dartz.dart';
import 'package:fo_fe/core/error/failures.dart';
import 'package:fo_fe/core/usecase/usecase.dart';
import 'package:fo_fe/features/organizer/all_items/tag/domain/repositories/tag_repository.dart';
import 'package:fo_fe/features/organizer/all_items/tag/utils/other/tag_params.dart';

class AddTagUseCase extends UseCase<int, TagParams> {
  final TagRepository repository;

  AddTagUseCase(this.repository);

  @override
  Future<Either<Failure, int>> call(TagParams params) async {
    return await repository.addTag(params.tagEntity);
  }
}
