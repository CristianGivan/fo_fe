import 'package:dartz/dartz.dart';
import 'package:fo_fe/core/error/failures.dart';
import 'package:fo_fe/core/usecase/usecase.dart';
import 'package:fo_fe/features/organizer/items/reminder/domain/entities/reminder_entity.dart';
import 'package:fo_fe/features/organizer/items/task/utils/task_exports.dart';
import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';

import '../repositories/task_repository.dart';

class AddReminderItemsToTaskUseCase
    extends UseCase<OrganizerItems<ReminderEntity>, AddItemsToTaskParams> {
  final TaskRepository repository;

  AddReminderItemsToTaskUseCase(this.repository);

  @override
  Future<Either<Failure, OrganizerItems<ReminderEntity>>> call(AddItemsToTaskParams params) {
    return repository.addReminderItemsToTask(params.taskId, params.itemsIds);
  }
}
