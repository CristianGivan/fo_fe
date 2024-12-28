import 'package:dartz/dartz.dart';
import 'package:fo_fe/core/error/failures.dart';
import 'package:fo_fe/core/usecase/usecase.dart';
import 'package:fo_fe/features/organizer/items/task/utils/other/task_params.dart';

import '../repositories/task_repository.dart';

class DeleteItemUseCase extends UseCase<int, TaskParams> {
  final TaskRepository repository;

  DeleteItemUseCase(this.repository);

  @override
  Future<Either<Failure, int>> call(TaskParams params) {
    return repository.deleteTask(params.id);
  }
}
