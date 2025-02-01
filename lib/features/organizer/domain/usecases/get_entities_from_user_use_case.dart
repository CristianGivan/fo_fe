import 'package:dartz/dartz.dart';
import 'package:fo_fe/core/error/failures.dart';
import 'package:fo_fe/core/usecase/usecase.dart';
import 'package:fo_fe/features/organizer/all_items/tag/utils/tag_exports.dart';
import 'package:fo_fe/features/organizer/all_items/task/domain/repositories/task_repository.dart';
import 'package:fo_fe/features/organizer/all_items/user/domain/repositories/user_repository.dart';
import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';

typedef FetchEntities<T extends ItemEntity> = Future<Either<Failure, OrganizerItems<T>>> Function(
    int userId);

class GetEntitiesFromUserUseCase<T extends ItemEntity>
    extends UseCase<OrganizerItems<T>, ItemParams> {
  final TaskRepository taskRepository;
  final TagRepository tagRepository;
  final UserRepository userRepository;

  GetEntitiesFromUserUseCase(this.tagRepository, this.taskRepository, this.userRepository);

  @override
  Future<Either<Failure, OrganizerItems<T>>> call(ItemParams params) {
    final fetchFunction = typeToFetchFunctionMap[params.itemType] as FetchEntities<T>?;

    if (fetchFunction == null) {
      return Future.value(Left(UnexpectedFailure("Invalid params")));
    }

    return fetchFunction(params.forUserId);
  }

  late final Map<ItemsTypeEnum, FetchEntities<ItemEntity>> typeToFetchFunctionMap = {
    ItemsTypeEnum.task: (userId) => taskRepository.getTaskEntitiesFromUser(userId),
    ItemsTypeEnum.user: (userId) => userRepository.getPendingAndAcceptedUserItems(userId),
    ItemsTypeEnum.tag: (userId) => tagRepository.getTagEntitiesFromUser(userId),
  };
}
