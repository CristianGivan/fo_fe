import 'package:fo_fe/features/organizer/all_items/tag/domain/entities/tag_entity.dart';
import 'package:fo_fe/features/organizer/all_items/task/domain/usecases/task_link_use_case/get_task_link_use_case.dart';
import 'package:fo_fe/features/organizer/all_items/task/domain/usecases/task_link_use_case/update_task_link_use_case.dart';
import 'package:fo_fe/features/organizer/all_items/user/utils/user_exports.dart';
import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';
import 'package:get_it/get_it.dart';

OrganizerLinkBloc<T> createTaskLinkBloc<T extends ItemEntity>(ItemsTypeEnum itemType) {
  switch (itemType) {
    case ItemsTypeEnum.taskUser:
      return _getTaskUserLinkBloc<T>();
    case ItemsTypeEnum.taskTag:
      return _getTaskTagLinkBloc<T>();
    default:
      throw UnsupportedError('Unsupported itemType: $itemType');
  }
}

OrganizerLinkBloc<T> _getTaskUserLinkBloc<T extends ItemEntity>() {
  final GetTaskLinkUseCase<UserEntity> getTaskUserUseCase = GetIt.instance.get();
  final UpdateTaskLinkUseCase<UserEntity> updateTaskUserUseCase = GetIt.instance.get();
  return TaskUserLinkBloc(
    getTaskUserUseCase: getTaskUserUseCase,
    updateTaskUserUseCase: updateTaskUserUseCase,
  ) as OrganizerLinkBloc<T>;
}

OrganizerLinkBloc<T> _getTaskTagLinkBloc<T extends ItemEntity>() {
  final GetTaskLinkUseCase<TagEntity> getTaskTagUseCase = GetIt.instance.get();
  final UpdateTaskLinkUseCase<TagEntity> updateTaskTagUseCase = GetIt.instance.get();
  return TaskTagLinkBloc(
    getTaskTagUseCase: getTaskTagUseCase,
    updateTaskTagUseCase: updateTaskTagUseCase,
  ) as OrganizerLinkBloc<T>;
}
