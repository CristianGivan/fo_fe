import 'package:dartz/dartz.dart';
import 'package:fo_fe/core/error/failures.dart';
import 'package:fo_fe/core/usecase/usecase.dart';
import 'package:fo_fe/features/organizer/all_items/task/utils/task_exports.dart';
import 'package:fo_fe/features/organizer/all_items/user/domain/entities/user_entity.dart';
import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';

import '../../repositories/task_repository.dart';

class UpdateLinkItemsOfItemUseCase<T extends ItemEntity>
    extends UseCase<OrganizerItems<T>, ItemParams> {
  final TaskRepository repository;

  UpdateLinkItemsOfItemUseCase(this.repository);

  @override
  Future<Either<Failure, OrganizerItems<T>>> call(ItemParams params) {
    if (params.itemType == ItemsTypeEnum.task) {
      final userParams = params as UpdateLinkItemsOfItemParams<UserEntity>;

      final result = repository.updateTaskUserItems(
        userParams.itemId,
        userParams.addedItems.getIdList(),
        userParams.removedItems.getIdList(),
      ) as Future<Either<Failure, OrganizerItems<T>>>;
      return result;
    } else {
      return Future.value(Left(UnexpectedFailure("Invalid params")));
    }
  }
}
