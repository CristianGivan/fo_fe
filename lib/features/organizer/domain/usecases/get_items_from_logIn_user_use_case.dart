import 'package:dartz/dartz.dart';
import 'package:fo_fe/core/error/failures.dart';
import 'package:fo_fe/core/usecase/usecase.dart';
import 'package:fo_fe/features/organizer/all_items/tag/utils/tag_exports.dart';
import 'package:fo_fe/features/organizer/all_items/task/domain/repositories/task_repository.dart';
import 'package:fo_fe/features/organizer/all_items/user/domain/repositories/user_repository.dart';
import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';

class GetItemsFromLogInUserUseCase<T extends DtoEntity>
    extends UseCase<OrganizerItems<T>, ItemParams> {
  final TaskRepository taskRepository;
  final TagRepository tagRepository;
  final UserRepository userRepository;

  GetItemsFromLogInUserUseCase(this.tagRepository, this.taskRepository, this.userRepository);

  @override
  Future<Either<Failure, OrganizerItems<T>>> call(params) async {
    if (params.itemType == ItemsTypeEnum.task) {
      return taskRepository.getTaskItemsFromUser(params.forUserId)
          as Future<Either<Failure, OrganizerItems<T>>>;
    } else if (params.itemType == ItemsTypeEnum.user) {
      return userRepository.getPendingAndAcceptedUserItems(params.forUserId)
          as Future<Either<Failure, OrganizerItems<T>>>;
    } else {
      return Future.value(Left(UnexpectedFailure("Invalid params")));
    }
  }
}
