import 'package:dartz/dartz.dart';
import 'package:fo_fe/core/error/failures.dart';
import 'package:fo_fe/core/usecase/usecase.dart';
import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';

import '../../all_items/task/domain/repositories/task_repository.dart';

class DeleteItemUseCase<T extends ItemEntity, P extends ItemParams> extends UseCase<int, P> {
  final TaskRepository repository;

  DeleteItemUseCase(this.repository);

  @override
  Future<Either<Failure, int>> call(P params) {
    return repository.deleteTask(params.id);
  }
}
