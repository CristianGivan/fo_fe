import 'package:dartz/dartz.dart';
import 'package:fo_fe/core/error/failures.dart';
import 'package:fo_fe/features/organizer/elements/task/domain/repositories/task_repository.dart';
import 'package:fo_fe/features/organizer/elements/task/task_lib.dart';

class GetTaskById {
  final TaskRepository taskRepository;

  GetTaskById(this.taskRepository);
  Future<Either<Failure, TaskEntity>>  execute({required int id}) async{
    return await taskRepository.getTaskById(id);
  }
}
