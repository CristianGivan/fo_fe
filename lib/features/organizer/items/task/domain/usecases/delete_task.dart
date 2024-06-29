import 'package:dartz/dartz.dart';
import 'package:fo_fe/core/error/failures.dart';
import 'package:fo_fe/features/organizer/items/task/domain/repositories/task_repository.dart';

class DeleteTask {
  final TaskRepository taskRepository;

  DeleteTask(this.taskRepository);

  Future<Either<Failure, void>> call(int taskId) async {
    return await taskRepository.deleteTask(taskId);
  }
}
