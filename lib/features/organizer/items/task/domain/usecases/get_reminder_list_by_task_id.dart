import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:fo_fe/core/error/failures.dart';
import 'package:fo_fe/core/usecase/usecase.dart';
import 'package:fo_fe/core/util/organizer/core_util_organizer.dart';
import 'package:fo_fe/features/organizer/items/reminder/reminder_exports.dart';

import '../repositories/task_repository.dart';

class GetRemindersByTaskId extends UseCase<OrganizerItems<ReminderEntity>,
    GetRemindersByTaskIdParams> {
  final TaskRepository repository;

  GetRemindersByTaskId(this.repository);

  @override
  Future<Either<Failure, OrganizerItems<ReminderEntity>>> call(
      GetRemindersByTaskIdParams params) {
    return repository.getRemindersByTaskId(params.taskId);
  }
}

class GetRemindersByTaskIdParams extends Equatable {
  final int taskId;

  GetRemindersByTaskIdParams({required this.taskId});

  @override
  List<Object> get props => [taskId];
}
