import 'package:dartz/dartz.dart';
import 'package:fo_fe/core/error/failures.dart';
import 'package:fo_fe/core/usecase/usecase.dart';
import 'package:fo_fe/features/organizer/all_items/tag/utils/tag_exports.dart';
import 'package:fo_fe/features/organizer/domain/entities/item_entity.dart';

class AddTagUseCase extends UseCase<TagDto, TagEntity> {
  final TagRepository repository;

  AddTagUseCase(this.repository);

  @override
  Future<Either<Failure, TagDto>> call(ItemEntity params) async {
    //todo -implement-
    return Future.value(Left(UnImplementedFailure("Invalid params")));
  }
}
