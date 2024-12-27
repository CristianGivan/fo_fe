import 'package:dartz/dartz.dart';
import 'package:fo_fe/core/error/failures.dart';
import 'package:fo_fe/core/usecase/usecase.dart';
import 'package:fo_fe/features/organizer/items/tag/utils/parameters/tag_params.dart';
import 'package:fo_fe/features/organizer/items/tag/utils/tag_exports.dart';
import 'package:fo_fe/features/organizer/items/task/domain/repositories/task_repository.dart';
import 'package:fo_fe/features/organizer/items/task/utils/task_exports.dart';
import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';

class GetItemsFromLogInUserUseCase<T extends ItemEntity, P extends ItemParams>
    extends UseCase<OrganizerItems<T>, P> {
  final TaskRepository taskRepository;
  final TagRepository tagRepository;

  GetItemsFromLogInUserUseCase(this.tagRepository, this.taskRepository);

  @override
  Future<Either<Failure, OrganizerItems<T>>> call(P params) {
    if (params is TaskParams) {
      return taskRepository
          .getTaskItemsFromUser(params)
          .then((result) => result as Either<Failure, OrganizerItems<T>>);
    } else if (params is TagParams) {
      return tagRepository
          .getTagItemsAll()
          .then((result) => result as Either<Failure, OrganizerItems<T>>);
    } else {
      return Future.value(Left(UnexpectedFailure("Invalid params")));
    }
  }
}
