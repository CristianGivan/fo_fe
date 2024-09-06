import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:fo_fe/core/error/failures.dart';
import 'package:fo_fe/core/usecase/usecase.dart';

import '../repositories/task_repository.dart';

class AddReminderToTask extends UseCase<int, AddReminderToTaskParams> {
  final TaskRepository repository;

  AddReminderToTask(this.repository);

  @override
  Future<Either<Failure, int>> call(AddReminderToTaskParams params) {
    return repository.addReminderToTask(params.taskId, params.reminderId);
  }
}

class AddReminderToTaskParams extends Equatable {
  final int taskId;
  final int reminderId;

  const AddReminderToTaskParams({required this.taskId, required this.reminderId});

  @override
  List<Object> get props => [taskId, reminderId];
}
