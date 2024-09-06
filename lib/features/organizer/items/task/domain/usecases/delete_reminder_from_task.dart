import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:fo_fe/core/error/failures.dart';
import 'package:fo_fe/core/usecase/usecase.dart';

import '../repositories/task_repository.dart';

class DeleteReminderFromTask
    extends UseCase<int, DeleteReminderFromTaskParams> {
  final TaskRepository repository;

  DeleteReminderFromTask(this.repository);

  @override
  Future<Either<Failure, int>> call(DeleteReminderFromTaskParams params) {
    return repository.deleteReminderFromTask(params.taskId, params.reminderId);
  }
}

class DeleteReminderFromTaskParams extends Equatable {
  final int taskId;
  final int reminderId;

  const DeleteReminderFromTaskParams(
      {required this.taskId, required this.reminderId});

  @override
  List<Object> get props => [taskId, reminderId];
}
