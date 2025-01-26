import 'package:fo_fe/features/organizer/all_items/tag/utils/tag_exports.dart';
import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';

import '../../../all_items/user/domain/entities/user_entity.dart';

typedef CreateItemLinkParams = ItemLinkParams Function(int id, int forUserId, IdSet? idSet);

class TaskLinkParamsFactory {
  static ItemLinkParams create<T extends ItemEntity>(
      {required int id, required int forUserId, IdSet? idSet}) {
    final createItemLinkParams = typeToParams[T];

    if (createItemLinkParams == null) {
      throw UnsupportedError('Unsupported type: $T');
    } else {
      return createItemLinkParams(id, forUserId, idSet);
    }
  }

  static final Map<Type, CreateItemLinkParams> typeToParams = {
    UserEntity: createTaskUserLinkParams,
    TagEntity: createTaskTagLinkParams,
  };

  static TaskUserLinkParams createTaskUserLinkParams(int id, int forUserId, IdSet? idSet) {
    return TaskUserLinkParams(id: id, idSet: idSet, forUserId: forUserId);
  }

  static TaskTagLinkParams createTaskTagLinkParams(int id, int forUserId, IdSet? idSet) {
    return TaskTagLinkParams(id: id, idSet: idSet, forUserId: forUserId);
  }
}
