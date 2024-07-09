import 'package:dartz/dartz.dart';
import 'package:fo_fe/core/error/failures.dart';
import 'package:fo_fe/features/organizer/items/task/domain/repositories/task_repository.dart';

import '../../task_lib.dart';

class AddTask {
  final TaskRepository taskRepository;

  AddTask(this.taskRepository);

  Future<Either<Failure, void>> call(TaskEntity task) async =>
      await taskRepository.insertTask(task);
}
