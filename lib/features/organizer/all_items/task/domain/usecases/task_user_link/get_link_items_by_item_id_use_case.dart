import 'package:dartz/dartz.dart';
import 'package:fo_fe/core/error/failures.dart';
import 'package:fo_fe/core/usecase/usecase.dart';
import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';

import '../../repositories/task_repository.dart';

class GetLinkItemsByItemIdUseCase extends UseCase<OrganizerItems<ItemEntity>, ItemParams> {
  final TaskRepository taskRepository;

  GetLinkItemsByItemIdUseCase(this.taskRepository);

  @override
  Future<Either<Failure, OrganizerItems<ItemEntity>>> call(ItemParams params) {
    if (params.itemType != ItemsTypeEnum.task) {
      return taskRepository.getUserItemsByTaskId(params.id);
    } else {
      return Future.value(Left(UnexpectedFailure("Invalid params")));
    }
  }
}
