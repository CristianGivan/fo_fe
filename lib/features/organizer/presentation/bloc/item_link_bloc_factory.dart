import 'package:fo_fe/features/organizer/all_items/task/presentation/logic/task_link_bloc/task_link_bloc_factory.dart';
import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';

class ItemLinkBlocFactory {
  static OrganizerLinkBloc<T> createFor<T extends ItemEntity>(ItemsTypeEnum itemType) {
    if (itemType == ItemsTypeEnum.taskUser ||
        itemType == ItemsTypeEnum.taskReminder ||
        itemType == ItemsTypeEnum.taskTag) {
      return TaskLinksBlocFactory.createFor<T>();
    } else {
      throw UnsupportedError('Unsupported type: $T');
    }
  }
}
