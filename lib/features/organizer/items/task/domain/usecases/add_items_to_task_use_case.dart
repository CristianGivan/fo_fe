import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:fo_fe/core/error/failures.dart';
import 'package:fo_fe/core/usecase/usecase.dart';
import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';

import '../repositories/task_repository.dart';

class AddItemsToTaskUseCase<T extends OrganizerItemEntity>
    extends UseCase<OrganizerItems<T>, AddItemsToTaskParams> {
  final TaskRepository repository;

  AddItemsToTaskUseCase(this.repository);

  @override
  Future<Either<Failure, OrganizerItems<T>>> call(AddItemsToTaskParams params) {
    if (params.itemType == ItemsType.tag) {
      return repository.addTagItemsToTask(params.taskId, params.itemsIds)
          as Future<Either<Failure, OrganizerItems<T>>>;
    } else if (params.itemType == ItemsType.reminder) {
      return repository.addReminderItemsToTask(params.taskId, params.itemsIds)
          as Future<Either<Failure, OrganizerItems<T>>>;
    } else {
      throw UnsupportedError("Unsupported item type: ${params.itemType}");
    }
  }
}

class AddItemsToTaskParams extends Equatable {
  final int taskId;
  final IdSet itemsIds;
  final ItemsType itemType;

  const AddItemsToTaskParams({
    required this.taskId,
    required this.itemsIds,
    required this.itemType,
  });

  @override
  List<Object> get props => [taskId, itemsIds, itemType];
}
