import 'package:dartz/dartz.dart';
import 'package:fo_fe/core/error/failures.dart';
import 'package:fo_fe/features/organizer/items/organizer_item/domain/entities/user_entity.dart';
import 'package:fo_fe/features/organizer/items/task/domain/repositories/task_repository.dart';

class AddUserToTask {
  final TaskRepository taskRepository;

  AddUserToTask(this.taskRepository);

  Future<Either<Failure, void>> call(int taskId, UserEntity user) async {
    return await taskRepository.addUserToTask(taskId, user.id);
  }
}
