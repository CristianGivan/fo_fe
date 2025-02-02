import 'package:dartz/dartz.dart';
import 'package:fo_fe/core/error/failures.dart';
import 'package:fo_fe/core/usecase/usecase.dart';
import 'package:fo_fe/features/organizer/all_items/tag/utils/tag_exports.dart';
import 'package:fo_fe/features/organizer/all_items/task/domain/repositories/task_repository.dart';
import 'package:fo_fe/features/organizer/all_items/user/utils/user_exports.dart';
import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';

typedef GetTaskLink<T extends ItemEntity> = Future<Either<Failure, OrganizerItems<T>>> Function(
    ItemLinkParams params);

class GetTaskLinksUseCase<T extends ItemEntity> extends UseCase<OrganizerItems<T>, ItemLinkParams> {
  final TaskRepository repository;

  GetTaskLinksUseCase(this.repository);

  @override
  Future<Either<Failure, OrganizerItems<T>>> call(ItemLinkParams params) {
    final getTaskLink = typeToGetTaskLinkMap[T] as GetTaskLink<T>?;

    if (getTaskLink == null) {
      return Future.value(Left(UnexpectedFailure("No handler found for type $T")));
    }

    return getTaskLink(params);
  }

  late final Map<Type, GetTaskLink<ItemEntity>> typeToGetTaskLinkMap = {
    UserEntity: (params) => repository.getUserItemsByTaskId(params.itemId),
    TagEntity: (params) => repository.getTagItemsByTaskId(params.itemId),
  };
}
