import 'package:dartz/dartz.dart';
import 'package:fo_fe/core/error/failures.dart';
import 'package:fo_fe/core/usecase/usecase.dart';
import 'package:fo_fe/features/organizer/items/task/utils/task_exports.dart';

import '../repositories/task_repository.dart';

class AddTaskUseCase extends UseCase<int, TaskParams> {
  final TaskRepository repository;

  AddTaskUseCase(this.repository);

  @override
  Future<Either<Failure, int>> call(TaskParams params) {
    return repository.addTask(params.task);
  }
}
