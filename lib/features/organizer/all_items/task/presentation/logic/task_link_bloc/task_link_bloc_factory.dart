import 'package:fo_fe/features/organizer/all_items/tag/domain/entities/tag_entity.dart';
import 'package:fo_fe/features/organizer/all_items/task/domain/usecases/task_link_use_case/get_task_link_use_case.dart';
import 'package:fo_fe/features/organizer/all_items/task/domain/usecases/task_link_use_case/update_task_link_use_case.dart';
import 'package:fo_fe/features/organizer/all_items/user/utils/user_exports.dart';
import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';
import 'package:get_it/get_it.dart';

class TaskLinksBlocFactory {
  static OrganizerLinkBloc<T> createFor<T extends ItemEntity>() {
    final bloc = typeToBlocMap[T];
    if (bloc == null) {
      throw UnsupportedError('Unsupported type: $T');
    } else {
      return bloc as OrganizerLinkBloc<T>;
    }
  }

  static final Map<Type, OrganizerLinkBloc<ItemEntity>> typeToBlocMap = {
    UserEntity: _getTaskUserLinkBloc(),
    TagEntity: _getTaskTagLinkBloc(),
  };

  static TaskUserLinksBloc _getTaskUserLinkBloc<T extends ItemEntity>() {
    final GetTaskLinkUseCase<UserEntity> getTaskUserUseCase = GetIt.instance.get();
    final UpdateTaskLinkUseCase<UserEntity> updateTaskUserUseCase = GetIt.instance.get();
    return TaskUserLinksBloc(
      getTaskUserUseCase: getTaskUserUseCase,
      updateTaskUserUseCase: updateTaskUserUseCase,
    );
  }

  static TaskTagLinksBloc _getTaskTagLinkBloc<T extends ItemEntity>() {
    final GetTaskLinkUseCase<TagEntity> getTaskTagUseCase = GetIt.instance.get();
    final UpdateTaskLinkUseCase<TagEntity> updateTaskTagUseCase = GetIt.instance.get();
    return TaskTagLinksBloc(
      getTaskTagUseCase: getTaskTagUseCase,
      updateTaskTagUseCase: updateTaskTagUseCase,
    );
  }
}
