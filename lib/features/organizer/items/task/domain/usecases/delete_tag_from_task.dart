import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:fo_fe/core/error/failures.dart';
import 'package:fo_fe/core/usecase/usecase.dart';

import '../repositories/task_repository.dart';

class DeleteTagFromTask extends UseCase<int, DeleteTagFromTaskParams> {
  final TaskRepository repository;

  DeleteTagFromTask(this.repository);

  @override
  Future<Either<Failure, int>> call(DeleteTagFromTaskParams params) {
    return repository.deleteTagFromTask(params.taskId, params.tagId);
  }
}

class DeleteTagFromTaskParams extends Equatable {
  final int taskId;
  final int tagId;

  const DeleteTagFromTaskParams({required this.taskId, required this.tagId});

  @override
  List<Object> get props => [taskId, tagId];
}
