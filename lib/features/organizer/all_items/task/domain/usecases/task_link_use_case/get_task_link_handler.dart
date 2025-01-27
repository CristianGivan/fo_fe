import 'package:dartz/dartz.dart';
import 'package:fo_fe/core/utils/exports/core_utils_exports.dart';
import 'package:fo_fe/features/organizer/all_items/tag/utils/tag_exports.dart';
import 'package:fo_fe/features/organizer/all_items/task/domain/repositories/task_repository.dart';
import 'package:fo_fe/features/organizer/all_items/user/utils/user_exports.dart';
import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';

abstract class GetTaskLinkHandler<T extends ItemEntity> {
  Future<Either<Failure, OrganizerItems<T>>> handle(ItemLinkParams params);
}

class TaskUserHandler extends GetTaskLinkHandler<UserEntity> {
  final TaskRepository taskRepository;

  TaskUserHandler(this.taskRepository);

  @override
  Future<Either<Failure, OrganizerItems<UserEntity>>> handle(ItemLinkParams params) {
    return taskRepository.getUserItemsByTaskId(params.itemId);
  }
}

class TaskTagHandler extends GetTaskLinkHandler<TagEntity> {
  final TaskRepository taskRepository;

  TaskTagHandler(this.taskRepository);

  @override
  Future<Either<Failure, OrganizerItems<TagEntity>>> handle(ItemLinkParams params) {
    return taskRepository.getTagItemsByTaskId(params.itemId);
  }
}
