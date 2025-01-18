import 'package:dartz/dartz.dart';
import 'package:fo_fe/core/utils/exports/core_utils_exports.dart';
import 'package:fo_fe/features/organizer/all_items/tag/utils/tag_exports.dart';
import 'package:fo_fe/features/organizer/all_items/task/domain/repositories/task_repository.dart';
import 'package:fo_fe/features/organizer/all_items/user/utils/user_exports.dart';
import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';

abstract class ItemTypeHandler<T extends ItemEntity> {
  Future<Either<Failure, OrganizerItems<T>>> handle(int id);
}

class TaskUserHandler extends ItemTypeHandler<UserEntity> {
  final TaskRepository taskRepository;

  TaskUserHandler(this.taskRepository);

  @override
  Future<Either<Failure, OrganizerItems<UserEntity>>> handle(int id) {
    return taskRepository.getUserItemsByTaskId(id);
  }
}

class TaskTagHandler extends ItemTypeHandler<TagEntity> {
  final TaskRepository taskRepository;

  TaskTagHandler(this.taskRepository);

  @override
  Future<Either<Failure, OrganizerItems<TagEntity>>> handle(int id) {
    return taskRepository.getTagItemsByTaskId(id);
  }
}

class ItemTypeHandlerRegistry {
  final Map<ItemsTypeEnum, ItemTypeHandler> _handlers = {};

  void registerHandler(ItemsTypeEnum itemType, ItemTypeHandler handler) {
    _handlers[itemType] = handler;
  }

  ItemTypeHandler? getHandler(ItemsTypeEnum itemType) {
    return _handlers[itemType];
  }
}
