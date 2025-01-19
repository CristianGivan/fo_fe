import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';

class ItemsLinkParamsFactory {
  static ItemLinkParams create({
    required int id,
    IdSet? idSet,
    int forUserId = 0,
    required ItemsTypeEnum itemType,
  }) {
    switch (itemType) {
      case ItemsTypeEnum.taskUser:
        return _createTaskUserLinkParams(id, idSet, forUserId);
      case ItemsTypeEnum.taskTag:
        return _createTaskTagLinkParams(id, idSet, forUserId);
      default:
        throw UnsupportedError('Unsupported itemType: $itemType');
    }
  }

  static TaskUserLinkParams _createTaskUserLinkParams(
    int id,
    IdSet? idSet,
    int forUserId,
  ) {
    return TaskUserLinkParams(
      id: id,
      idSet: idSet,
      forUserId: forUserId,
    );
  }

  static TaskTagLinkParams _createTaskTagLinkParams(
    int id,
    IdSet? idSet,
    int forUserId,
  ) {
    return TaskTagLinkParams(
      id: id,
      idSet: idSet,
      forUserId: forUserId,
    );
  }
}
