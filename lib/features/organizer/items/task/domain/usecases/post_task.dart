import 'package:fo_fe/features/organizer/items/task/domain/repositories/task_repository.dart';

class PostTask {
  TaskRepository taskRepository;

  PostTask(
    this.taskRepository,
  );

// Future<Either<Failure, TaskEntity>> call(TaskEntity taskEntity) async {
//   return await taskRepository.postTask(taskEntity);
// }
}
