import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:fo_fe/core/error/failures.dart';
import 'package:fo_fe/core/usecase/usecase.dart';
import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';

import '../repositories/task_repository.dart';

class UpdateItemsOfTask<T extends OrganizerItemEntity>
    extends UseCase<OrganizerItems<T>, UpdateItemsToTaskParams<T>> {
  final TaskRepository repository;

  UpdateItemsOfTask(this.repository);

  @override
  Future<Either<Failure, OrganizerItems<T>>> call(UpdateItemsToTaskParams params) {
    List<int> addedTagItems = params.items.getAddedItems(params.updatedItems).getIdList();
    List<int> removedTagItems = params.items.getRemovedItems(params.updatedItems).getIdList();

    switch (params.itemType) {
      case ItemsType.tag:
        return repository.updateTagItemOfTask(params.taskId, addedTagItems, removedTagItems)
            as Future<Either<Failure, OrganizerItems<T>>>;
        ;
      case ItemsType.reminder:
        return repository.updateReminderItemOfTask(params.taskId, addedTagItems, removedTagItems)
            as Future<Either<Failure, OrganizerItems<T>>>;
        ;
      default:
        throw UnsupportedError("Unsupported item type: ${params.itemType}");
    }
  }
}

class UpdateItemsToTaskParams<T extends OrganizerItemEntity> extends Equatable {
  final int taskId;
  final OrganizerItems<T> items;
  final OrganizerItems<T> updatedItems;
  final ItemsType itemType;

  const UpdateItemsToTaskParams({
    required this.taskId,
    required this.items,
    required this.updatedItems,
    required this.itemType,
  });

  @override
  List<Object> get props => [taskId, items, updatedItems, itemType];
}
