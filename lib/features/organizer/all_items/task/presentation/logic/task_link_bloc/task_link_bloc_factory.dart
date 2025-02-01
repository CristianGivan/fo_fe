import 'package:fo_fe/features/organizer/all_items/tag/domain/entities/tag_entity.dart';
import 'package:fo_fe/features/organizer/all_items/user/utils/user_exports.dart';
import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';

class TaskLinksBlocFactory {
  static OrganizerLinkBloc<T> createFor<T extends ItemEntity>() {
    if (T == UserEntity) {
      return TaskUserLinksBloc() as OrganizerLinkBloc<T>;
    } else if (T == TagEntity) {
      return TaskTagLinksBloc() as OrganizerLinkBloc<T>;
    } else {
      throw UnsupportedError('Unsupported type: $T');
    }
  }
}
