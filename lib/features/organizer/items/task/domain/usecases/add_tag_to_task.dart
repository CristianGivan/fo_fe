import 'package:dartz/dartz.dart';
import 'package:fo_fe/core/error/failures.dart';
import 'package:fo_fe/features/organizer/items/tag/domain/entities/tag_entity.dart';
import 'package:fo_fe/features/organizer/items/task/domain/repositories/task_repository.dart';

class AddTagToTask {
  final TaskRepository taskRepository;

  AddTagToTask(this.taskRepository);

  Future<Either<Failure, void>> call(int taskId, TagEntity tag) async {
    return await taskRepository.addTagToTask(taskId, tag.id);
  }
// @override
// Future<Either<Failure, void>> call(Params params) async {
//   return await taskRepository.addTagToTask(params.id, params.id2);
// }
}
