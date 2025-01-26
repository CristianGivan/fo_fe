import 'package:fo_fe/features/organizer/all_items/tag/domain/entities/tag_entity.dart';
import 'package:fo_fe/features/organizer/all_items/user/utils/user_exports.dart';
import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';

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
    UserEntity: TaskUserLinksBloc(),
    TagEntity: TaskTagLinksBloc(),
  };
}
