import 'package:dartz/dartz.dart';
import 'package:fo_fe/core/error/failures.dart';
import 'package:fo_fe/core/usecase/usecase.dart';
import 'package:fo_fe/features/organizer/all_items/tag/utils/tag_exports.dart';
import 'package:fo_fe/features/organizer/all_items/task/domain/repositories/task_repository.dart';
import 'package:fo_fe/features/organizer/all_items/task/utils/task_exports.dart';
import 'package:fo_fe/features/organizer/domain/entities/dto_entity.dart';
import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';

class GetItemsFromLogInUserUseCase<T extends DtoEntity, P extends ItemParams>
    extends UseCase<OrganizerItems<ItemEntity>, P> {
  final TaskRepository taskRepository;
  final TagRepository tagRepository;

  GetItemsFromLogInUserUseCase(this.tagRepository, this.taskRepository);

  @override
  Future<Either<Failure, OrganizerItems<TaskDto>>> call(P params) {
    if (params is TaskParams) {
      return taskRepository.getTaskItemsFromUser(params);
    } else {
      return Future.value(Left(UnexpectedFailure("Invalid params")));
    }
  }
}
