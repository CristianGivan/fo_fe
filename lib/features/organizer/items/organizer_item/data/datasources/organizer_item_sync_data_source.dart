import 'package:fo_fe/features/organizer/items/organizer_item/config/organizer_item_export.dart';

abstract class OrganizerItemSyncDataSource<T extends OrganizerItemEntity> {
  Future<OrganizerItems<T>> syncTaskListWithIdSet(IdSet idSet);
}

class OrganizerItemSyncDataSourceImpl<T extends OrganizerItemEntity>
    implements OrganizerItemSyncDataSource<T> {
  @override
  Future<OrganizerItems<T>> syncTaskListWithIdSet(IdSet idSet) {
    // TODO: implement syncTaskListWithIdSet
    throw UnimplementedError();
  }
}
