import 'package:dartz/dartz.dart';
import 'package:fo_fe/core/utils/exports/core_utils_exports.dart';
import 'package:fo_fe/features/organizer/all_items/tag/utils/tag_exports.dart';
import 'package:fo_fe/features/organizer/all_items/task/domain/repositories/task_repository.dart';
import 'package:fo_fe/features/organizer/all_items/user/utils/user_exports.dart';
import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';

abstract class UpdateTaskLinkHandler<T extends ItemEntity> {
  Future<Either<Failure, OrganizerItems<T>>> handle(UpdateLinkParams<T> params);
}

class TaskUserUpdateHandler extends UpdateTaskLinkHandler<UserEntity> {
  final TaskRepository taskRepository;

  TaskUserUpdateHandler(this.taskRepository);

  @override
  Future<Either<Failure, OrganizerItems<UserEntity>>> handle(UpdateLinkParams<UserEntity> params) {
    return taskRepository.updateTaskUserItems(
      params.itemId,
      params.addedItems.getIdList(),
      params.removedItems.getIdList(),
    );
  }
}

class TaskTagUpdateHandler extends UpdateTaskLinkHandler<TagEntity> {
  final TaskRepository taskRepository;

  TaskTagUpdateHandler(this.taskRepository);

  @override
  Future<Either<Failure, OrganizerItems<TagEntity>>> handle(UpdateLinkParams<TagEntity> params) {
    return taskRepository.updateTaskTagItems(
      params.itemId,
      params.addedItems.getIdList(),
      params.removedItems.getIdList(),
    );
  }
}
