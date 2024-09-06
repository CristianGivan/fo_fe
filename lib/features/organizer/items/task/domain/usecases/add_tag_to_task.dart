import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:fo_fe/core/error/failures.dart';
import 'package:fo_fe/core/usecase/usecase.dart';

import '../repositories/task_repository.dart';

class AddTagToTask extends UseCase<int, AddTagToTaskParams> {
  final TaskRepository repository;

  AddTagToTask(this.repository);

  @override
  Future<Either<Failure, int>> call(AddTagToTaskParams params) {
    return repository.addTagToTask(params.taskId, params.tagId);
  }
}

class AddTagToTaskParams extends Equatable {
  final int taskId;
  final int tagId;

  const AddTagToTaskParams({required this.taskId, required this.tagId});

  @override
  List<Object> get props => [taskId, tagId];
}
