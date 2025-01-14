import 'package:dartz/dartz.dart';
import 'package:fo_fe/core/error/failures.dart';
import 'package:fo_fe/core/usecase/usecase.dart';
import 'package:fo_fe/features/organizer/all_items/reminder/utils/reminder_exports.dart';
import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';

import '../../repositories/task_repository.dart';

class UpdateReminderItemsOfTaskUseCase
    extends UseCase<OrganizerItems<Reminder>, UpdateItemsOfItemParams<Reminder>> {
  final TaskRepository repository;

  UpdateReminderItemsOfTaskUseCase(this.repository);

  @override
  Future<Either<Failure, OrganizerItems<Reminder>>> call(UpdateItemsOfItemParams params) async {
    // List<int> addedTagItems = params.items.getAddedItems(params.updatedItems).getIdList();
    // List<int> removedTagItems = params.items.getRemovedItems(params.updatedItems).getIdList();

    // return repository.updateTaskReminderItems(params.itemId, addedTagItems, removedTagItems);
    return Future.value(Left(UnexpectedFailure("Invalid params")));
  }
}
