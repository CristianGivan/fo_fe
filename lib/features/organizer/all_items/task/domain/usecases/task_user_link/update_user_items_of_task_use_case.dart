import 'package:dartz/dartz.dart';
import 'package:fo_fe/core/error/failures.dart';
import 'package:fo_fe/core/usecase/usecase.dart';
import 'package:fo_fe/features/organizer/all_items/task/utils/task_exports.dart';
import 'package:fo_fe/features/organizer/all_items/user/domain/entities/user_entity.dart';
import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';

import '../../repositories/task_repository.dart';

class UpdateUserItemsOfTaskUseCase
    extends UseCase<OrganizerItems<UserEntity>, UpdateItemsToTaskParams<UserEntity>> {
  final TaskRepository repository;

  UpdateUserItemsOfTaskUseCase(this.repository);

  @override
  Future<Either<Failure, OrganizerItems<UserEntity>>> call(UpdateItemsToTaskParams params) {
    List<int> addedUserItems = params.items.getAddedItems(params.updatedItems).getIdList();
    List<int> removedUserItems = params.items.getRemovedItems(params.updatedItems).getIdList();
    return repository.updateTaskUserItems(params.taskId, addedUserItems, removedUserItems);
  }
}
