import 'package:dartz/dartz.dart';
import 'package:fo_fe/core/error/failures.dart';
import 'package:fo_fe/core/usecase/usecase.dart';
import 'package:fo_fe/features/organizer/all_items/tag/domain/repositories/tag_repository.dart';
import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';

class DeleteTagUseCase extends UseCase<IdSet, IdSet> {
  final TagRepository repository;

  DeleteTagUseCase(this.repository);

  @override
  Future<Either<Failure, IdSet>> call(IdSet idSet) {
    // return repository.deleteTaskItems(idSet);
    return Future.value(Left(UnImplementedFailure("Invalid params")));
  }
}
