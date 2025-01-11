import 'package:dartz/dartz.dart';
import 'package:fo_fe/core/error/failures.dart';
import 'package:fo_fe/core/usecase/usecase.dart';
import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';

import '../../repositories/task_repository.dart';

class GetLinkItemsByItemIdUseCase<T extends ItemEntity>
    extends UseCase<OrganizerItems<T>, ItemsLinkParams> {
  final TaskRepository taskRepository;

  GetLinkItemsByItemIdUseCase(this.taskRepository);

  @override
  Future<Either<Failure, OrganizerItems<T>>> call(ItemsLinkParams params) {
    if (params.itemType == ItemsTypeEnum.taskUser) {
      return taskRepository.getUserItemsByTaskId(params.id)
          as Future<Either<Failure, OrganizerItems<T>>>;
    } else if (params.itemType == ItemsTypeEnum.taskTag) {
      return taskRepository.getTagItemsByTaskId(params.id)
          as Future<Either<Failure, OrganizerItems<T>>>;
    } else {
      return Future.value(Left(UnexpectedFailure("Invalid params")));
    }
  }
}
