import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:fo_fe/core/error/failures.dart';
import 'package:fo_fe/core/usecase/usecase.dart';
import 'package:fo_fe/features/organizer/items/reminder/utils/reminder_exports.dart';
import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';

import '../repositories/task_repository.dart';

//todo -dry-
class UpdateReminderItemsOfTask extends UseCase<OrganizerItems<ReminderEntity>,
    UpdateReminderItemsToTaskParams> {
  final TaskRepository repository;

  UpdateReminderItemsOfTask(this.repository);

  @override
  Future<Either<Failure, OrganizerItems<ReminderEntity>>> call(
      UpdateReminderItemsToTaskParams params) {
    List<int> addedReminderItems = params.reminderItems
        .getAddedItems(params.updatedReminderItems)
        .getIdList();
    List<int> removedReminderItems = params.reminderItems
        .getRemovedItems(params.updatedReminderItems)
        .getIdList();

    return repository.updateReminderItemOfTask(
        params.taskId, addedReminderItems, removedReminderItems);
  }
}

class UpdateReminderItemsToTaskParams extends Equatable {
  final int taskId;
  final OrganizerItems<ReminderEntity> reminderItems;
  final OrganizerItems<ReminderEntity> updatedReminderItems;

  const UpdateReminderItemsToTaskParams({
    required this.taskId,
    required this.reminderItems,
    required this.updatedReminderItems,
  });

  @override
  List<Object> get props => [taskId, reminderItems, updatedReminderItems];
}
