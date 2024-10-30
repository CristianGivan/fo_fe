import 'package:dartz/dartz.dart';
import 'package:fo_fe/core/error/failures.dart';
import 'package:fo_fe/core/usecase/usecase.dart';
import 'package:fo_fe/features/organizer/items/reminder/utils/reminder_exports.dart';
import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';

import '../repositories/task_repository.dart';

class GetReminderItemsByTaskIdUseCase
    extends UseCase<OrganizerItems<ReminderEntity>, GetRemindersByTaskIdParams> {
  final TaskRepository repository;

  GetReminderItemsByTaskIdUseCase(this.repository);

  @override
  Future<Either<Failure, OrganizerItems<ReminderEntity>>> call(GetRemindersByTaskIdParams params) {
    return repository.getRemindersByTaskId(params.taskId);
  }
}

class GetRemindersByTaskIdParams extends Equatable {
  final int taskId;

  const GetRemindersByTaskIdParams({required this.taskId});

  @override
  List<Object> get props => [taskId];
}
