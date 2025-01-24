import 'package:dartz/dartz.dart';
import 'package:fo_fe/core/error/failures.dart';
import 'package:fo_fe/core/usecase/usecase.dart';
import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';

import '../../repositories/task_repository.dart';

class DeleteTaskItemsUseCase extends UseCase<IdSet, IdSet> {
  final TaskRepository repository;

  DeleteTaskItemsUseCase(this.repository);

  @override
  Future<Either<Failure, IdSet>> call(IdSet idSet) {
    return repository.deleteTaskItems(idSet);
  }
}
