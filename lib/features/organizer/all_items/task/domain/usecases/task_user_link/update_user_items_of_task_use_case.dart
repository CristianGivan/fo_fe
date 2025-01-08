import 'package:dartz/dartz.dart';
import 'package:fo_fe/core/error/failures.dart';
import 'package:fo_fe/core/usecase/usecase.dart';
import 'package:fo_fe/features/organizer/all_items/task/utils/task_exports.dart';
import 'package:fo_fe/features/organizer/all_items/user/domain/entities/user_entity.dart';
import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';

import '../../repositories/task_repository.dart';

class UpdateUserItemsOfTaskUseCase
    extends UseCase<OrganizerItems<UserEntity>, UpdateLinkItemsOfItemParams<UserEntity>> {
  final TaskRepository repository;

  UpdateUserItemsOfTaskUseCase(this.repository);

  @override
  Future<Either<Failure, OrganizerItems<UserEntity>>> call(UpdateLinkItemsOfItemParams params) {
    List<int> addedUserItems;
    List<int> removedUserItems;
    if (params.items.isEmpty && params.updatedItems.isEmpty) {
      return Future.value(Left(TaskFailure("No items to update")));
    } else if (params.items.isEmpty && !params.updatedItems.isEmpty) {
      addedUserItems = params.updatedItems.getIdList();
      removedUserItems = [];
    } else if (!params.items.isEmpty && params.updatedItems.isEmpty) {
      addedUserItems = [];
      removedUserItems = params.items.getIdList();
    } else {
      addedUserItems = params.items.getAddedItems(params.updatedItems).getIdList();
      removedUserItems = params.items.getRemovedItems(params.updatedItems).getIdList();
    }
    return repository.updateTaskUserItems(params.itemId, addedUserItems, removedUserItems);
  }
}
