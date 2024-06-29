import 'package:fo_fe/features/organizer/items/task/domain/repositories/task_repository.dart';

class UpdateTask {
  final TaskRepository taskRepository;

  UpdateTask(this.taskRepository);

// Future<Either<Failure, void>> call(TaskEntity task) async {
//   return await taskRepository.updateTask(task);
// }
}
