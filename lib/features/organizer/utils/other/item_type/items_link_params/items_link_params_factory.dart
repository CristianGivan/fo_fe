import 'package:fo_fe/features/organizer/all_items/tag/utils/tag_exports.dart';
import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';

import '../../../../all_items/user/domain/entities/user_entity.dart';

typedef CreateItemLinkParams = ItemLinkParams Function(int id, int forUserId);

class TaskLinkParamsFactory {
  static ItemLinkParams create<T extends ItemEntity>({required int id, required int forUserId}) {
    final createItemLinkParams = typeToParams[T];

    if (createItemLinkParams == null) {
      throw UnsupportedError('Unsupported type: $T');
    } else {
      return createItemLinkParams(id, forUserId);
    }
  }

  static final Map<Type, CreateItemLinkParams> typeToParams = {
    UserEntity: createTaskUserLinkParams,
    TagEntity: createTaskTagLinkParams,
  };

  static TaskUserLinkParams createTaskUserLinkParams(int id, int forUserId) {
    return TaskUserLinkParams(id: id, forUserId: forUserId);
  }

  static TaskTagLinkParams createTaskTagLinkParams(int id, int forUserId) {
    return TaskTagLinkParams(id: id, forUserId: forUserId);
  }
}
