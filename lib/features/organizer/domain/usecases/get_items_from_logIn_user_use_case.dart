import 'package:dartz/dartz.dart';
import 'package:fo_fe/core/error/failures.dart';
import 'package:fo_fe/core/usecase/usecase.dart';
import 'package:fo_fe/features/organizer/all_items/tag/utils/tag_exports.dart';
import 'package:fo_fe/features/organizer/all_items/task/domain/repositories/task_repository.dart';
import 'package:fo_fe/features/organizer/domain/entities/dto_entity.dart';
import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';

class GetItemsFromLogInUserUseCase<T extends DtoEntity> extends UseCase<OrganizerItems<T>, int> {
  final TaskRepository taskRepository;
  final TagRepository tagRepository;
  final ItemsTypeEnum itemsType;

  GetItemsFromLogInUserUseCase(this.tagRepository, this.taskRepository, this.itemsType);

  @override
  Future<Either<Failure, OrganizerItems<T>>> call(int userId) async {
    if (itemsType == ItemsTypeEnum.task) {
      return taskRepository.getTaskItemsFromUser(userId)
          as Future<Either<Failure, OrganizerItems<T>>>;
    } else {
      return Future.value(Left(UnexpectedFailure("Invalid params")));
    }
  }
}
