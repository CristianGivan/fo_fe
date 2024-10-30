import 'package:dartz/dartz.dart';
import 'package:fo_fe/core/error/failures.dart';
import 'package:fo_fe/core/usecase/usecase.dart';
import 'package:fo_fe/features/organizer/items/task/utils/task_exports.dart';

import '../repositories/task_repository.dart';

class UpdateTaskUseCase extends UseCase<bool, TaskParams> {
  final TaskRepository repository;

  UpdateTaskUseCase(this.repository);

  @override
  Future<Either<Failure, bool>> call(TaskParams params) {
    return repository.updateTask(params.task);
  }
}
