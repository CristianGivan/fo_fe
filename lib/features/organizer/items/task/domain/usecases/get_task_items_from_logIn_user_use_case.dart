import 'package:dartz/dartz.dart';
import 'package:fo_fe/core/error/failures.dart';
import 'package:fo_fe/core/usecase/usecase.dart';
import 'package:fo_fe/features/organizer/items/tag/utils/parameters/tag_params.dart';
import 'package:fo_fe/features/organizer/items/tag/utils/tag_exports.dart';
import 'package:fo_fe/features/organizer/items/task/domain/repositories/task_repository.dart';
import 'package:fo_fe/features/organizer/items/task/utils/task_exports.dart';
import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';

class GetTaskItemsFromLogInUserUseCase
    extends UseCase<OrganizerItems<OrganizerItemBase>, ItemParams> {
  final TaskRepository taskRepository;
  final TagRepository tagRepository;

  GetTaskItemsFromLogInUserUseCase(this.tagRepository, this.taskRepository);

  @override
  Future<Either<Failure, OrganizerItems<OrganizerItemBase>>> call(ItemParams params) {
    if (params is TaskParams) {
      return taskRepository.getTaskItemsFromUser(params);
    } else if (params is TagParams) {
      return tagRepository.getTagItemsAll();
    } else {
      return Future.value(Left(UnexpectedFailure("Invalid params")));
    }
  }
}
