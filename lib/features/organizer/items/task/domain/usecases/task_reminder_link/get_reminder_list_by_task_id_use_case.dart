import 'package:dartz/dartz.dart';
import 'package:fo_fe/core/error/failures.dart';
import 'package:fo_fe/core/usecase/usecase.dart';
import 'package:fo_fe/features/organizer/items/reminder/utils/reminder_exports.dart';
import 'package:fo_fe/features/organizer/items/task/utils/task_exports.dart';
import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';

import '../../repositories/task_repository.dart';

class GetReminderItemsByTaskIdUseCase extends UseCase<OrganizerItems<ReminderEntity>, TaskParams> {
  final TaskRepository repository;

  GetReminderItemsByTaskIdUseCase(this.repository);

  @override
  Future<Either<Failure, OrganizerItems<ReminderEntity>>> call(TaskParams params) {
    return repository.getRemindersByTaskId(params.id);
  }
}
