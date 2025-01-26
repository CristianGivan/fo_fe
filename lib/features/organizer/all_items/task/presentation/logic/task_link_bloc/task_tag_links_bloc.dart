import 'package:fo_fe/features/organizer/all_items/tag/utils/tag_exports.dart';
import 'package:fo_fe/features/organizer/all_items/task/domain/usecases/task_link_use_case/update_task_link_use_case.dart';
import 'package:fo_fe/features/organizer/all_items/task/utils/task_exports.dart';
import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';

class TaskTagLinksBloc extends OrganizerLinkBloc<TagEntity> {
  TaskTagLinksBloc({
    required GetTaskLinkUseCase<TagEntity> getTaskTagUseCase,
    required UpdateTaskLinkUseCase<TagEntity> updateTaskTagUseCase,
  }) : super(
          getItemsLinked: getTaskTagUseCase,
          updateItemsLinked: updateTaskTagUseCase,
        ) {
    setupEventHandlers();
  }
}
