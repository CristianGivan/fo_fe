import 'package:fo_fe/features/organizer/all_items/task/domain/usecases/task_link_use_case/update_task_link_use_case.dart';
import 'package:fo_fe/features/organizer/all_items/task/utils/task_exports.dart';
import 'package:fo_fe/features/organizer/all_items/user/utils/user_exports.dart';
import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';
import 'package:get_it/get_it.dart';

class TaskUserLinksBloc extends OrganizerLinkBloc<UserEntity> {
  TaskUserLinksBloc()
      : super(
          getItemsLinked: GetIt.instance<GetTaskLinkUseCase<UserEntity>>(),
          updateItemsLinked: GetIt.instance<UpdateTaskLinkUseCase<UserEntity>>(),
        );
}
